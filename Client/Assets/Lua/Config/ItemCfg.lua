---
--- Created by shang.
--- DateTime: 2017/12/25 13:28
---

require("Common.XmlParser");

ItemCfg = {};
local this = ItemCfg;

function ItemCfg.LoadCfg()
    local text = resMgr:LoadConfig("Config", "Item", "Item");
    local xmlnode = XmlParser.ParseXmlText(text);

    for i, v in pairs(xmlnode.Nodes.Node) do
        local id = v["@ID"];
        this[id] = {};
        this[id].ID = id;
        this[id].ItemType = v["@ItemType"];
        this[id].EquipType = v["@EquipType"];
        this[id].Name = v["@Name"];
        this[id].Icon = v["@Icon"];
        this[id].AttrType = v["@AttrType"];
        this[id].AttrValue = v["@AttrValue"];
    end
end

function ItemCfg.GetItemCfg(id)
    return  this[tostring(id)];
end