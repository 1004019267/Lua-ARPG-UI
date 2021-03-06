---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2018/11/8 14:33
---
require("Common.msgid")
require("Global.PlayerCache")
require("View.BagWnd")

BagHandler = {};
local this = BagHandler;

function BagHandler.Register()
    networkMgr:Register(msgid.INV_Equip_SRES, BagHandler.OnRespWear);
end

function BagHandler.OnRespWear(m)
    local msg = bag_pb.RspWear();
    local data = ByteArray.GetBuffer(m.message);
    msg:ParseFromString(data);
    local item=PlayerCache.GetBagItem(msg.itemId);
    PlayerCache.addAtk=msg.atk;
    PlayerCache.addDef=msg.def;
    BagWnd.Refresh();
    BagWnd.WearWhat(item,BagWnd.thisBtn);
end


