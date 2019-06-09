using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using LuaInterface;

namespace LuaFramework
{
    public class NetworkManager : MonoBehaviour
    {

        private NetClient _client;

        public static NetworkManager Instance;

        void Awake()
        {
            Instance = this;

            _client = new NetClient();
            _client.log = Log;
        }

        

        private void Log(string content)
        {
            Debug.Log(content);
        }

        public void OnInit()
        {
            CallMethod("Start");
        }

        public void Unload()
        {
            CallMethod("Unload");
        }

        /// <summary>
        /// ִ��Lua����
        /// </summary>
        public object[] CallMethod(string func, params object[] args)
        {
            return Util.CallMethod("Network", func, args);
        }


        /// <summary>
        /// ����Command�����ﲻ����ķ���˭��
        /// </summary>
        void Update()
        {
            _client.Update();
        }

        /// <summary>
        /// ������������
        /// </summary>
        public void SendConnect()
        {
            _client.ConnectServer(AppConst.SocketAddress, AppConst.SocketPort);
        }


        public void Register(int msgid, Action<SocketModel> action)
        {
            _client.Register(msgid, action);
        }


        public void SendMessage(int command, ByteArray array)
        {
            _client.Send(command, array.getBuff());
        }

        /// <summary>
        /// ��������
        /// </summary>
        void OnDestroy()
        {
            _client.Disconnect();

            Instance = null;
            Debug.Log("~NetworkManager was destroy");
        }
    }
}