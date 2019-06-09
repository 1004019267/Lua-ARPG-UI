﻿using UnityEngine;
using System.Collections;
using LuaInterface;
using System;

namespace LuaFramework
{
    public class LuaManager : MonoBehaviour
    {
        private LuaState lua;
        private LuaLoader loader;
        private LuaLooper loop = null;

        public static LuaManager Instance;

        // Use this for initialization
        void Awake()
        {
            Instance = this;

            loader = new LuaLoader();
            lua = new LuaState();
            this.OpenLibs();
            lua.LuaSetTop(0);

            LuaBinder.Bind(lua);
            DelegateFactory.Init();
            LuaCoroutine.Register(lua, this);
        }

        public void InitStart()
        {
            InitLuaPath();
            InitLuaBundle();
            this.lua.Start();    //启动LUAVM
            //this.StartMain();
            this.StartLooper();
        }

        void StartLooper()
        {
            loop = gameObject.AddComponent<LuaLooper>();
            loop.luaState = lua;
        }

        //cjson 比较特殊，只new了一个table，没有注册库，这里注册一下
        protected void OpenCJson()
        {
            lua.LuaGetField(LuaIndexes.LUA_REGISTRYINDEX, "_LOADED");
            lua.OpenLibs(LuaDLL.luaopen_cjson);
            lua.LuaSetField(-2, "cjson");

            lua.OpenLibs(LuaDLL.luaopen_cjson_safe);
            lua.LuaSetField(-2, "cjson.safe");
        }

        void StartMain()
        {
            lua.DoFile("Global/Main.lua");

            LuaFunction main = lua.GetFunction("Main");
            main.Call();
            main.Dispose();
            main = null;
        }

        /// <summary>
        /// 初始化加载第三方库
        /// </summary>
        void OpenLibs()
        {
            lua.OpenLibs(LuaDLL.luaopen_pb);
            lua.OpenLibs(LuaDLL.luaopen_sproto_core);
            lua.OpenLibs(LuaDLL.luaopen_protobuf_c);
            lua.OpenLibs(LuaDLL.luaopen_lpeg);
            lua.OpenLibs(LuaDLL.luaopen_bit);
            lua.OpenLibs(LuaDLL.luaopen_socket_core);

            this.OpenCJson();

            if (AppConst.DebugMode)
            {
                if (LuaConst.openLuaSocket)
                {
                    OpenLuaSocket();
                }
            }
        }

        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int LuaOpen_Socket_Core(IntPtr L)
        {
            return LuaDLL.luaopen_socket_core(L);
        }

        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int LuaOpen_Mime_Core(IntPtr L)
        {
            return LuaDLL.luaopen_mime_core(L);
        }

        protected void OpenLuaSocket()
        {
            LuaConst.openLuaSocket = true;
            lua.BeginPreLoad();
            lua.RegFunction("socket.core", LuaOpen_Socket_Core);
            lua.RegFunction("mime.core", LuaOpen_Mime_Core);
            lua.EndPreLoad();
        }

        /// <summary>
        /// 初始化Lua代码加载路径
        /// </summary>
        void InitLuaPath()
        {
            if (AppConst.DebugMode)
            {
                string rootPath = AppConst.FrameworkRoot;
                lua.AddSearchPath(rootPath + "/Lua");
                lua.AddSearchPath(rootPath + "/Lua/pblua");
                lua.AddSearchPath(rootPath + "/ToLua/Lua");
                lua.AddSearchPath(rootPath + "/ToLua/Lua/protobuf");
            }
            else
            {
                lua.AddSearchPath(Util.DataPath + "lua");
            }
        }

        /// <summary>
        /// 初始化LuaBundle
        /// </summary>
        void InitLuaBundle()
        {
            if (loader.beZip)
            {
                loader.AddBundle("lua/lua.unity3d");

                //loader.AddBundle("lua/lua_protobuf.unity3d");

                loader.AddBundle("lua/lua_3rd_cjson.unity3d");
                loader.AddBundle("lua/lua_3rd_event.unity3d");
                loader.AddBundle("lua/lua_3rd_luabitop.unity3d");
                loader.AddBundle("lua/lua_3rd_pbc.unity3d");
                loader.AddBundle("lua/lua_3rd_pblua.unity3d");
                //loader.AddBundle("lua/lua_3rd_sprotobuf.luascript.unity3d");
                loader.AddBundle("lua/lua_3rd_sproto.unity3d");

                loader.AddBundle("lua/lua_cjson.unity3d");
                loader.AddBundle("lua/lua_common.unity3d");
                loader.AddBundle("lua/lua_config.unity3d");
                loader.AddBundle("lua/lua_global.unity3d");
                loader.AddBundle("lua/lua_handler.unity3d");
                loader.AddBundle("lua/lua_jit.unity3d");

                loader.AddBundle("lua/lua_lpeg.unity3d");
                loader.AddBundle("lua/lua_misc.unity3d");
                loader.AddBundle("lua/lua_pblua.unity3d");
                loader.AddBundle("lua/lua_protobuf.unity3d");
                loader.AddBundle("lua/lua_scene.unity3d");
                loader.AddBundle("lua/lua_socket.unity3d");

                loader.AddBundle("lua/lua_system.unity3d");
                loader.AddBundle("lua/lua_system_reflection.unity3d");
                loader.AddBundle("lua/lua_test.unity3d");
                loader.AddBundle("lua/lua_unityengine.unity3d");
                loader.AddBundle("lua/lua_view.unity3d");

                //loader.AddBundle("lua/lua_math.unity3d");
                //loader.AddBundle("lua/lua_system.unity3d");
                //loader.AddBundle("lua/lua_system_reflection.unity3d");
                //loader.AddBundle("lua/lua_unityengine.unity3d");
                //loader.AddBundle("lua/lua_common.unity3d");
                //loader.AddBundle("lua/lua_logic.unity3d");
                //loader.AddBundle("lua/lua_view.unity3d");
                //loader.AddBundle("lua/lua_controller.unity3d");
                //loader.AddBundle("lua/lua_misc.unity3d");

            }
        }

        public void DoFile(string filename)
        {
            lua.DoFile(filename);
        }

        // Update is called once per frame
        public object[] CallFunction(string funcName, params object[] args)
        {
            LuaFunction func = lua.GetFunction(funcName);
            if (func != null)
            {
                return func.LazyCall(args);
            }
            return null;
        }

        public void LuaGC()
        {
            lua.LuaGC(LuaGCOptions.LUA_GCCOLLECT);
        }

        public void Close()
        {
            if(loop != null)
            {
                loop.Destroy();
                loop = null;
            }

            lua.Dispose();
            lua = null;
            loader = null;

            Instance = null;
        }
    }
}