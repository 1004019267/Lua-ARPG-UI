using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using role;
using common;
class RoleHandler : IMsgHandler
{
    public void RegisterMsg(Dictionary<MsgID, Action<UserToken, SocketModel>> handlers)
    {
        handlers.Add(MsgID.CHAR_CREATE_CREQ, OnCreate);
        handlers.Add(MsgID.CHAR_ONLINE_CREQ, OnLine);
    }

    private void OnLine(UserToken token, SocketModel model)
    {
       ReqSetRole req= SerializeUtil.Deserialize<ReqSetRole>(model.message);
        AccountData acc = CacheManager.instance.GetAccount(req.id);
        RoleCfg1 cfg = RoleCfgLoad.instance.GetRoleID(req.roleId);
        RspSetRole rsp = new RspSetRole();
        acc.roleId = rsp.roleId;
        rsp.atk = cfg.Atk;
        rsp.def = cfg.Def;
        rsp.Hp = cfg.Hp;
        rsp.roleId = cfg.ID;
        rsp.roleName = cfg.RoleName;
        
        NetworkManager.Send<RspSetRole>(token, (int)MsgID.CHAR_ONLINE_SRES, rsp);
    }

    private void OnCreate(UserToken token, SocketModel model)
    {
        ReqBuyRole req = SerializeUtil.Deserialize<ReqBuyRole>(model.message);
        AccountData acc = CacheManager.instance.GetAccount(req.id);
        RoleCfg1 cfg = RoleCfgLoad.instance.GetRoleID(req.roleId);
        RspBuyRole rsp = new RspBuyRole();
        if (acc.gold >= cfg.Money)
        {
            RoleData role = new RoleData();
            role.roleId = cfg.ID;
            acc.roleHave.Add(role);

            acc.gold -= cfg.Money;                       
            rsp.lastGold = acc.gold;
            rsp.roleId = cfg.ID;
            rsp.msgtips = (uint)MsgTips.CharCreateSuccess;
        }
        else
        {
            rsp.msgtips = (uint)MsgTips.CharCreateFalse;
        }

        NetworkManager.Send<RspBuyRole>(token, (int)MsgID.CHAR_CREATE_SRES, rsp);
    }
}

