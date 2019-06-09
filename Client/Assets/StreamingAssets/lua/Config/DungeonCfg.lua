---
--- Created by shang.
--- DateTime: 2017/12/25 13:28
---

require("Common.XmlParser");

DungeonCfg = {};
local this = DungeonCfg;

function DungeonCfg.LoadCfg()
    local text = resMgr:LoadConfig("Config", "Dungeon", "Dungeon");
    local xmlnode = XmlParser.ParseXmlText(text);

    for i, v in pairs(xmlnode.Nodes.Node) do
        local id = v["@ID"];
        this[id] = {};
        this[id].ID = tonumber(id);
        this[id].Name = v["@Name"];
        this[id].Scene = v["@Scene"];
    end
end

function DungeonCfg.GetDungeonCfg(id)
    return this[id];
end
