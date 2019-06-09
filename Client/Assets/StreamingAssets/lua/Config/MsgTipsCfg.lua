---
--- Created by shang.
--- DateTime: 2017/12/25 13:29
---
require("Common.XmlParser");

MsgTipsCfgDic = {};
local this = MsgTipsCfgDic;

function MsgTipsCfgDic.LoadCfg()
    local text = resMgr:LoadConfig("Config", "MsgTips", "MsgTips");
    local xmlnode = XmlParser.ParseXmlText(text);

    for i, v in pairs(xmlnode.Nodes.Node) do
        local id = v["@ID"];
        this[id] = {};
        this[id].ID = id;
        this[id].Value = v["@Value"];
    end
end

function MsgTipsCfgDic.GetMsgTips(id)
    return this[tostring(id)].Value;
end