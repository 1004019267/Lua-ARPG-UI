using UnityEngine;
using System.Collections;

namespace LuaFramework
{

    public class Main : MonoBehaviour
    {
        void Start()
        {
            //AppFacade.Instance.StartUp();                           // 启动游戏

            gameObject.AddComponent<LuaManager>();
            gameObject.AddComponent<PanelManager>();
            gameObject.AddComponent<SoundManager>();
            gameObject.AddComponent<TimerManager>();
            gameObject.AddComponent<NetworkManager>();
            gameObject.AddComponent<ResourceManager>();
            gameObject.AddComponent<ThreadManager>();
            gameObject.AddComponent<ObjectPoolManager>();
            gameObject.AddComponent<GameManager>();
        }
    }
}