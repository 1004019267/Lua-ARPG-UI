using System;
using System.Collections.Generic;


public interface IMsgHandler
{
    void RegisterMsg(Dictionary<MsgID, Action<UserToken, SocketModel>> handlers);
}

public class HandlerCenter : IHandlerCenter
{
    private Dictionary<MsgID, Action<UserToken, SocketModel>> _handlers = new Dictionary<MsgID, Action<UserToken, SocketModel>>();

    private AccountHandler _accountHandler = new AccountHandler();

    //private CharacterHandler _characterHandler = new CharacterHandler();
    MallHandler _mallHandler = new MallHandler();

    private SelectDungeonHandler _dungeonHandler = new SelectDungeonHandler();
    BagHandler _bagHandler = new BagHandler();
    RoleHandler _roleHandler = new RoleHandler();

    public void Initialize()
    {
        _accountHandler.RegisterMsg(_handlers);
        //_characterHandler.RegisterMsg(_handlers);
        _mallHandler.RegisterMsg(_handlers);
        _dungeonHandler.RegisterMsg(_handlers);
        _bagHandler.RegisterMsg(_handlers);
        _roleHandler.RegisterMsg(_handlers);
    }

    /// <summary>
    /// 客户端连接到服务器
    /// </summary>
    /// <param name="token"></param>
    public void ClientConnect(UserToken token)
    {
        Console.WriteLine(string.Format("{0} Connnect...", token.address.ToString()));
    }

    /// <summary>
    /// 客户端断开连接
    /// </summary>
    /// <param name="token"></param>
    /// <param name="error"></param>
    public void ClientClose(UserToken token, string error)
    {
        Console.WriteLine(string.Format("{0} Disconnect...", token.address.ToString()));

        // 玩家下线，移除账号数据缓存
        if (token.accountid != 0 && CacheManager.instance.IsAccountOnline(token.accountid))
        {
            AccountData acc = CacheManager.instance.GetAccount(token.accountid);
            ////储存基本属性
            //string sql = string.Format("UPDATE account SET gold = {0}, diamond = {1} , roleId = {2} ,head = {3} , arm = {4} , chest = {5} WHERE id = '{6}';", acc.gold, acc.diamond, acc.roleId,acc.head.itemid,acc.arm.itemid,acc.chest.itemid, acc.id);
            //MysqlManager.instance.ExecNonQuery(sql);
            ////储存装备属性
            //sql = string.Format("DELETE FROM warehouse WHERE id = '{0}'", acc.id);
            //MysqlManager.instance.ExecNonQuery(sql);        
            //for (int i = 0; i < acc.bagEquip.Count; i++)
            //{
            //    EquipData equ = acc.bagEquip[i];
            //    sql = string.Format("INSERT INTO equip (id,itemId,atk,def,equipType) VALUES ({0},{1},{2},{3},{4})",acc.id,equ.itemid,equ.atk,equ.def,equ.equipType);
            //    MysqlManager.instance.ExecNonQuery(sql);
            //}         
            ////储存人物
            //sql= string.Format("DELETE FROM role WHERE id = '{0}'", acc.id);
            //MysqlManager.instance.ExecNonQuery(sql);
            //for (int i = 0; i < acc.roleHave.Count; i++)
            //{
            //    RoleData rol = acc.roleHave[i];
            //    sql= string.Format("INSERT INTO role (id,roleId) VALUES ({0},{1})", acc.id,rol.roleId);
            //    MysqlManager.instance.ExecNonQuery(sql);
            //}

            CacheManager.instance.AccountOffline(acc.id);
        }

        //// 玩家下线，移除角色数据缓存
        //if(token.characterid != 0 && CacheManager.instance.IsCharOnline(token.characterid))
        //{
        //    CharacterData ch = CacheManager.instance.GetCharData(token.characterid);
        //    CacheManager.instance.CharOffline(ch.id);
        //}
    }

    /// <summary>
    /// 服务端在收到客户端的消息之后要执行的方法
    /// </summary>
    /// <param name="token"></param>
    /// <param name="message"></param>
    public void MessageReceive(UserToken token, object message)
    {
        SocketModel model = message as SocketModel;
        Console.WriteLine(token.accountid + ", " + (MsgID)model.command);

        Action<UserToken, SocketModel> handler = _handlers[(MsgID)model.command];
        handler(token, model);
    }
}