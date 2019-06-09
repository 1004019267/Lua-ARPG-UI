---
--- Created by shang.
--- DateTime: 2017/12/19 12:25
---

require("Common.msgid")
require("Global.PlayerCache")
require("View.MallWnd")
MallHandler = {};
local this = MallHandler;

function MallHandler.Register()
    networkMgr:Register(msgid.BuyGoods_SRES, MallHandler.OnRspBuy);
end

function MallHandler.OnRspBuy(m)
    local msg = mall_pb.RspBuy();
    local data = ByteArray.GetBuffer(m.message);
    msg:ParseFromString(data);
    if msg.msgtips==1041 then
        PlayerCache.gold=msg.lastGold;
        PlayerCache.diamond=msg.lastDiamond;
        MallWnd.SetHave(PlayerCache.gold,PlayerCache.diamond);
        PlayerCache.AddBagItem(msg.itemId);
        MessageBox.Open();
        MessageBox.Show("购买成功");
        MallWnd.btnMall:GetComponent("Button").interactable = false;
    else
        MessageBox.Open();
        MessageBox.Show("金币或钻石不足");
    end
end