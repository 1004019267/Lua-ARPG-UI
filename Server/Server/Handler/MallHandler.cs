using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using mall;
using common;
class MallHandler : IMsgHandler
{
    public void RegisterMsg(Dictionary<MsgID, Action<UserToken, SocketModel>> handlers)
    {
        handlers.Add(MsgID.BuyGoods_CREQ, OnReqBuy);
    }

    private void OnReqBuy(UserToken token, SocketModel model)
    {
        ReqBuy req = SerializeUtil.Deserialize<ReqBuy>(model.message);
        AccountData acc = CacheManager.instance.GetAccount(req.id);
        RspBuy rsp = new RspBuy();
        MallCfg mall = MallCfgLoad.instance.GetMallItemID(req.itemId);
        ItemCfg item = ItemCfgLoad.instance.GetItemID(req.itemId);
        if (acc.gold >= mall.Gold && acc.diamond >= mall.Diamond)
        {
            EquipData equ = new EquipData();
            equ.itemid = item.ID;       
            if (item.AttrType == 1)
            {
                equ.atk = item.AttrValue;
            }
            if (item.AttrType == 2)
            {
                equ.def = item.AttrValue;
            }
            equ.equipType = (int)item.EquipType;
            acc.bagEquip.Add(equ);
            
            acc.gold -= mall.Gold;
            acc.diamond -= mall.Diamond;
            rsp.lastGold = acc.gold;
            rsp.lastDiamond = acc.diamond;
            rsp.itemId = req.itemId;
            rsp.msgtips = (uint)MsgTips.BuyGoodsSuccess;
        }
        else
        {
            rsp.msgtips = (uint)MsgTips.GoldNotEnough;
        }

        NetworkManager.Send<RspBuy>(token, (int)MsgID.BuyGoods_SRES, rsp);
    }
}

