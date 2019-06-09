---
--- Created by shang.
--- DateTime: 2017/12/22 16:45
---


require("Common.XmlParser");
require("Config.DungeonCfg");
require("Config.MsgTipsCfg");
require("Config.ItemCfg");
require("Config.MallCfg");
require("Config.RoleCfg")
ConfigManager = {};
local this = ConfigManager;


function ConfigManager.LoadAllCfg()
    DungeonCfg.LoadCfg();
    MsgTipsCfgDic.LoadCfg();
    ItemCfg.LoadCfg();
    MallCfg.LoadCfg();
    RoleCfg.LoadCfg();
end
