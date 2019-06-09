using UnityEngine;
using System.Collections.Generic;
using System.Reflection;
using LuaInterface;
using System;

namespace LuaFramework
{
    public static class LuaHelper
    {
        /// <summary>
        /// getType
        /// </summary>
        /// <param name="classname"></param>
        /// <returns></returns>
        public static System.Type GetType(string classname)
        {
            Assembly assb = Assembly.GetExecutingAssembly();  //.GetExecutingAssembly();
            System.Type t = null;
            t = assb.GetType(classname); ;
            if (t == null)
            {
                t = assb.GetType(classname);
            }
            return t;
        }

        /// <summary>
        /// 面板管理器
        /// </summary>
        public static PanelManager GetPanelManager()
        {
            return PanelManager.Instance;
        }

        /// <summary>
        /// 资源管理器
        /// </summary>
        public static ResourceManager GetResManager()
        {
            return ResourceManager.Instance;
        }

        /// <summary>
        /// 网络管理器
        /// </summary>
        public static NetworkManager GetNetManager()
        {
            return NetworkManager.Instance;
        }

        /// <summary>
        /// 音乐管理器
        /// </summary>
        public static SoundManager GetSoundManager()
        {
            return SoundManager.Instance;
        }

        public static LuaManager GetLuaManager()
        {
            return LuaManager.Instance;
        }

        public static LuaTimerManager GetLuaTimerManager()
        {
            return LuaTimerManager.instance;
        }

        public static LuaBattleManager GetBattleMgr()
        {
            return LuaBattleManager.instance;
        }

        /// <summary>
        /// pbc/pblua函数回调
        /// </summary>
        /// <param name="func"></param>
        public static void OnCallLuaFunc(LuaByteBuffer data, LuaFunction func)
        {
            if (func != null) func.Call(data);
            Debug.LogWarning("OnCallLuaFunc length:>>" + data.buffer.Length);
        }

        /// <summary>
        /// cjson函数回调
        /// </summary>
        /// <param name="data"></param>
        /// <param name="func"></param>
        public static void OnJsonCallFunc(string data, LuaFunction func)
        {
            Debug.LogWarning("OnJsonCallback data:>>" + data + " lenght:>>" + data.Length);
            if (func != null) func.Call(data);
        }
    }
}