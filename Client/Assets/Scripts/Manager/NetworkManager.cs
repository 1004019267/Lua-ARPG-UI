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
        /// 执行Lua方法
        /// </summary>
        public object[] CallMethod(string func, params object[] args)
        {
            return Util.CallMethod("Network", func, args);
        }


        /// <summary>
        /// 交给Command，这里不想关心发给谁。
        /// </summary>
        void Update()
        {
            _client.Update();
        }

        /// <summary>
        /// 发送链接请求
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
        /// 析构函数
        /// </summary>
        void OnDestroy()
        {
            _client.Disconnect();

            Instance = null;
            Debug.Log("~NetworkManager was destroy");
        }
    }
}