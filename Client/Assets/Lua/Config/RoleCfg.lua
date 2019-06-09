---
--- Created by shang.
--- DateTime: 2017/12/25 13:29
---
require("Common.XmlParser");

RoleCfg = {};
local this = RoleCfg;

function RoleCfg.LoadCfg()
    local text = resMgr:LoadConfig("Config", "Role", "Role");
    local xmlnode = XmlParser.ParseXmlText(text);

    for i, v in pairs(xmlnode.Nodes.Node) do
        local id = v["@ID"];
        this[id] = {};
        this[id].ID = "C"..id;
        this[id].RoleName = v["@RoleName"];
        this[id].RoleType = v["@RoleType"];
        this[id].Hp = v["@Hp"];
        this[id].Atk = v["@Atk"];
        this[id].Def = v["@Def"];
        this[id].Money = v["@Money"];
    end
end

function RoleCfg.GetRole(id)
    return this[tostring(id)];
end