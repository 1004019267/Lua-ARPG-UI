

using System;
using System.Collections.Generic;

[Serializable]
public class AccountData
{
    public int id;
    public string account;
    public string password;
    public int gold;
    public int diamond;
    public int roleId;
    public EquipData head=new EquipData();
    public EquipData arm=new EquipData();
    public EquipData chest=new EquipData();
    public List<EquipData> bagEquip = new List<EquipData>();
    public List<RoleData> roleHave = new List<RoleData>();
    
    public AccountData()
    {
      
    }

    public AccountData(int id, string account, string password, int gold, int diamond, int roleId, EquipData head, EquipData arm, EquipData chest, List<EquipData> bagEquip, List<RoleData> roleHave)
    {
        this.id = id;
        this.account = account;
        this.password = password;
        this.gold = gold;
        this.diamond = diamond;
        this.roleId = roleId;
        this.head = head;
        this.arm = arm;
        this.chest = chest;
        this.bagEquip = bagEquip;
        this.roleHave = roleHave;
    }
}
[Serializable]
public class RoleData
{
    public int roleId;
    public RoleData()
    {

    }

    public RoleData(int roleId)
    {
        this.roleId = roleId;
    }
}
[Serializable]
public class EquipData
{
    public int itemid;
    public int atk=0;
    public int def=0;
    public int equipType;
    public EquipData()
    {

    }
    public EquipData(int itemid, int atk, int def, int equipType)
    {
        this.itemid = itemid;
        this.atk = atk;
        this.def = def;
        this.equipType = equipType;
    }
}


/// <summary>
/// 账号
/// </summary>
public class Account
{
    /// <summary>
    /// 唯一ID
    /// </summary>
    public uint uid;

    public string accountName;

    // 所在匹配
    public uint globalMatchID;

    // 匹配的索引
    public int matchIndex = -1;

    // 阵营
    public common.Race roleSide;

    // 是否准备完成
    public bool ready = false;

    // 所在关卡的唯一ID
    public uint globalLevelID;

    // 关卡中的角色唯一ID
    public uint globalRoleID;

    /// <summary>
    /// 选择的英雄ID
    /// </summary>
    public uint heroID;


    public UserToken client;
}

//public partial class RedisCacheManager
//{
//    /// <summary>
//    /// 判断账号是否在线
//    /// </summary>
//    /// <returns></returns>
//    public bool IsAccountOnline(int accountid)
//    {
//        return _redis.Exist<AccountData>(accountid, accountid);
//    }

//    /// <summary>
//    /// 账号上线
//    /// </summary>
//    /// <param name="account"></param>
//    /// <param name="password"></param>
//    /// <returns></returns>
//    public void AccountOnline(int id,  string account, string password)
//    {
//        _redis.Set(id, id, new AccountData(id, account, password));
//    }

//    /// <summary>
//    /// 账号下线
//    /// </summary>
//    /// <param name="account"></param>
//    public void AccountOffline(int accountid)
//    {
//        _redis.Remove(accountid);
//    }

//    /// <summary>
//    /// 根据id获取已登录的角色数据
//    /// </summary>
//    /// <param name="id"></param>
//    /// <returns></returns>
//    public AccountData GetAccount(int id)
//    {
//        return _redis.Get<AccountData>(id, id);
//    }

//    public List<AccountData> GetAllAccount(int id)
//    {
//        return _redis.GetAll<AccountData>(id);
//    }
//}


partial class CacheManager : Singleton<CacheManager>
{
    // 保存所有的已经登录账号信息
    private Dictionary<int, AccountData> _accounts = new Dictionary<int, AccountData>();

    /// <summary>
    /// 判断账号是否在线
    /// </summary>
    /// <returns></returns>
    public bool IsAccountOnline(int accountid)
    {
        return _accounts.ContainsKey(accountid);
    }

    /// <summary>
    /// 账号上线
    /// </summary>
    /// <param name="account"></param>
    /// <param name="password"></param>
    /// <returns></returns>
    public void AccountOnline(int id, string account, string password)
    {
        AccountData data = new AccountData();
        data.id = id;
        data.account = account;
        data.password = password;
        string sql = string.Format("select * from account where id = '{0}'", id);
        List<AccountData> accDatas = MysqlManager.instance.ExecQuery<AccountData>(sql);
        AccountData acc = accDatas[0];
        data.gold = acc.gold;
        data.diamond=acc.diamond;
        data.roleId = acc.roleId;
        //data.head = acc.head;
        //data.arm = acc.arm;
        //data.chest = acc.chest;
        //sql = string.Format("SELECT * FROM equip WHERE id = '{0}'", acc.id);
        //List<EquipData> accItem = MysqlManager.instance.ExecQuery<EquipData>(sql);
        //data.bagEquip = accItem;

        //sql = string.Format("SELECT * FROM role WHERE id = '{0}'", acc.id);
        //List<RoleData> accRole = MysqlManager.instance.ExecQuery<RoleData>(sql);
        //data.roleHave = accRole;

        _accounts.Add(id, data);
    }

    /// <summary>
    /// 账号下线
    /// </summary>
    /// <param name="account"></param>
    public void AccountOffline(int accountid)
    {
        _accounts.Remove(accountid);
    }

    /// <summary>
    /// 根据id获取已登录的角色数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public AccountData GetAccount(int id)
    {
        return _accounts[id];
    }
}
