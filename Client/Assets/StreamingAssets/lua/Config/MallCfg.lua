---
--- Created by shang.
--- DateTime: 2017/12/25 13:28
---
require("Common.XmlParser");

MallCfg = {};
local this = MallCfg;

function MallCfg.LoadCfg()
    local text = resMgr:LoadConfig("Config", "Mall", "Mall");
    local xmlnode = XmlParser.ParseXmlText(text);

    for i, v in pairs(xmlnode.Nodes.Node) do
        local id = v["@ID"];
        this[id] = {};
        this[id].ID = id;
        this[id].ItemID = v["@ItemID"];
        this[id].Gold = v["@Gold"];
        this[id].Diamond = v["@Diamond"];
    end
end

function MallCfg.GetMallCfg(id)
    return this[tostring(id)];
end

function MallCfg.GetMallItemID(id)
    for i, v in pairs(this) do
        if type(v)=="table" and v.ItemID==tostring(id) then
            return v;
        end
    end
    return nil;
end