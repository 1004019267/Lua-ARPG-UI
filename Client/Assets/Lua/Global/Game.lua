
require "Global/WindowManager"

require "Common/functions"
require "Common/define"


require "View/LoginWnd"

require("Handler.AccountHandler")
require("Handler.InventroyHandler")
require("Handler.MailHandler")
require("Handler.MallHandler")
require("Handler.DungeonHandler")
require("Handler.BagHandler")
require("Handler.RoleHandler")

require("Scene.Loading")
require("Scene.Login")
require("Scene.MainScene")
require("Scene.Battle")

require("Global.ConfigManager")
require("Config.MsgTipsCfg")

--管理器--
Game = {};
local this = Game;


SceneType =
{
    Loading = 1,
    Login = 2,
    MainScene = 3,
    Battle = 4
}

scenetype = SceneType.Login;



---注册消息
function Game.RegisterMsg()
    AccountHandler.Register();
    DungeonHandler.Register();
    MallHandler.Register();
    BagHandler.Register();
    RoleHandler.Register();
end

---初始化完成，发送连接服务器信息--
function Game.OnInitOK()

    --- 载入配置
    ConfigManager.LoadAllCfg();

    --- UI管理器初始化
    WindowManager.Init();

    --- 注册消息
    Game.RegisterMsg();

    AppConst.SocketPort = 6650;
    AppConst.SocketAddress = "192.168.15.18";
    networkMgr:SendConnect();

    Loading.LoadScene("Login");
end


function Game.OnLevelWasLoaded(level)
    if level == SceneType.Loading then
        Loading.Initialize();
    elseif level == SceneType.Login then
        Login.Initialize();
    elseif level == SceneType.MainScene then
        MainScene.Initialize();
    elseif level >= SceneType.Battle then
        battleMgr:BattleStart(DataCache.battleid, DataCache.playercfgid);
    end
end

--- 销毁
function Game.OnDestroy()
	--logWarn('OnDestroy--->>>');
end

