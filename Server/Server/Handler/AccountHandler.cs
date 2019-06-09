using System;
using System.Collections.Generic;

using common;
using account;

public class AccountHandler : IMsgHandler
{
    public void RegisterMsg(Dictionary<MsgID, Action<UserToken, SocketModel>> handlers)
    {
        // 注册登录请求消息
        handlers.Add(MsgID.ACC_LOGIN_CREQ, OnLogin);
        handlers.Add(MsgID.ACC_REG_CREQ, OnRegister);
        handlers.Add(MsgID.ACC_OFFLINE_CREQ, OnOffline);
    }

    private void OnRegister(UserToken token, SocketModel model)
    {
        // 解析消息
        ReqRegister req = SerializeUtil.Deserialize<ReqRegister>(model.message);

        // 从数据库里查询有没有这个账号
        string sql = string.Format("select * from account where account = '{0}'", req.account);
        List<AccountData> accData = MysqlManager.instance.ExecQuery<AccountData>(sql);    
        RespRegister rsp = new RespRegister();
        if (accData.Count > 0)
        {
            rsp.msgtips = (uint)MsgTips.AccountRepeat;
        }
        else
        {
            rsp.msgtips = (uint)MsgTips.RegisterSuccess;

            // 往数据库里插入一个账号
            sql = string.Format("insert into account(account,password,gold,diamond,roleId,head,arm,chest) values('{0}','{1}',{2},{3},{4},{5},{6},{7})", req.account, req.password,10000,100,1001,0,0,0);
            MysqlManager.instance.ExecNonQuery(sql);
        }

        // 给客户端发送一个应答
        NetworkManager.Send(token, (int)MsgID.ACC_REG_SRES, rsp); 
    }
    private void OnLogin(UserToken token, SocketModel model)
    {
        ReqLogin req = SerializeUtil.Deserialize<ReqLogin>(model.message);

        RespLogin resp = new RespLogin();

        string sql = string.Format("select * from account where account = '{0}'", req.account);
        List<AccountData> accDatas = MysqlManager.instance.ExecQuery<AccountData>(sql);
        if (accDatas.Count <= 0)         // 没有这个账号
        {
            resp.msgtips = (uint)MsgTips.NoAccount;
        }
        else                            // 有这个账号
        {
            AccountData acc = accDatas[0];

            if (CacheManager.instance.IsAccountOnline(acc.id))     // 账号已经在线，就不让再登录了
            {
                resp.msgtips = (uint)MsgTips.AccountHasOnline;
            }
            else
            {
                if (acc.password == req.password)
                {
                    resp.msgtips = (uint)MsgTips.LoginSuccess;

                    CacheManager.instance.AccountOnline(acc.id, acc.account, acc.password);                   
                    resp.account = acc.account;
                    resp.gold = acc.gold;
                    resp.diamond = acc.diamond;
                    resp.id = acc.id;
                    resp.roleId = acc.roleId;
                    RoleCfg1 cfg = RoleCfgLoad.instance.GetRoleID(acc.roleId);
                    resp.Hp = cfg.Hp;
                    resp.atk = cfg.Atk;
                    resp.def = cfg.Def;

                    AccountData acc1 = CacheManager.instance.GetAccount(acc.id);
                    int atk = acc1.head.atk + acc1.arm.atk + acc1.chest.atk;
                    int def = acc1.head.def + acc1.arm.def + acc1.chest.def;
                    resp.addAtk = atk;
                    resp.addDef = def;

                    resp.head = acc1.head.itemid;
                    resp.arm = acc1.arm.itemid;
                    resp.chest = acc1.chest.itemid;
                    
                    for (int i = 0; i <acc1.roleHave.Count; i++)
                    {
                        resp.roleHave.Add(acc1.roleHave[0].roleId); 
                    }
                  
                    token.accountid = acc.id;
                }
                else
                {
                    resp.msgtips = (uint)MsgTips.PasswordError;
                }
            }
        }
        resp.account = req.account;       

        NetworkManager.Send(token, (int)MsgID.ACC_LOGIN_SRES, resp);
    }

    // 角色离线
    private void OnOffline(UserToken token, SocketModel model)
    {
        AccountData data = CacheManager.instance.GetAccount(token.accountid);
        CacheManager.instance.AccountOffline(data.id);

        RespOffline resp = new RespOffline();
        resp.msgtips = (uint)MsgTips.AccountOffline;
        NetworkManager.Send(token, (int)MsgID.ACC_OFFLINE_SRES, resp);
    }
}