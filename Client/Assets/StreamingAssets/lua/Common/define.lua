

Util = LuaFramework.Util;
AppConst = LuaFramework.AppConst;
LuaHelper = LuaFramework.LuaHelper;
ByteBuffer = LuaFramework.ByteBuffer;


resMgr = LuaHelper.GetResManager();
panelMgr = LuaHelper.GetPanelManager();
soundMgr = LuaHelper.GetSoundManager();
networkMgr = LuaHelper.GetNetManager();
timerMgr = LuaHelper.GetLuaTimerManager();
battleMgr = LuaHelper.GetBattleMgr();

WWW = UnityEngine.WWW;
GameObject = UnityEngine.GameObject;
SceneManager = UnityEngine.SceneManagement.SceneManager;
Time = UnityEngine.Time;

function pairsByKeys(t)
    local a = {}
    for n in pairs(t) do
        a[#a+1] = n
    end
    table.sort(a)
    local i = 0
    return function()
        i = i + 1
        return a[i], t[a[i]]
    end
end