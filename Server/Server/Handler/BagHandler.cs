using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using common;
using bag;
public class BagHandler : IMsgHandler
{
    public void RegisterMsg(Dictionary<MsgID, Action<UserToken, SocketModel>> handlers)
    {     
        handlers.Add(MsgID.INV_Equip_CREQ, OnEquip);    
    }

    private void OnEquip(UserToken token, SocketModel model)
    {
        ReqWear req = SerializeUtil.Deserialize<ReqWear>(model.message);
        AccountData acc = CacheManager.instance.GetAccount(req.id);
        EquipData equ = new EquipData();
        equ.itemid = req.itemId;
        if (req.attrType==1)
        {
            equ.atk = req.attrValue;
        }
        if (req.attrType==2)
        {
            equ.def = req.attrValue;
        }
        equ.equipType = req.equipType;

        if (req.equipType==0)
        {
            acc.head = equ;
        }
        else if(req.equipType == 1)
        {
            acc.arm = equ;
        }
        else if (req.equipType == 2)
        {
            acc.chest = equ;
        }

        int atk = acc.head.atk + acc.arm.atk + acc.chest.atk;
        int def = acc.head.def + acc.arm.def + acc.chest.def;
        RspWear rsp = new RspWear();
        rsp.atk = atk;
        rsp.def = def;
        rsp.itemId = req.itemId;

        NetworkManager.Send<RspWear>(token, (int)MsgID.INV_Equip_SRES, rsp);
    }
}