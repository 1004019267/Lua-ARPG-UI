---
--- Created by shang.
--- DateTime: 2017/12/19 12:12
---

require("Common.msgid")
require("Global.ConfigManager")
require("Config.MsgTipsCfg")
require("Global.PlayerCache")
AccountHandler = {};
local this = AccountHandler;

function AccountHandler.Register()
    networkMgr:Register(msgid.ACC_LOGIN_SRES, AccountHandler.OnRespLogin);
    networkMgr:Register(msgid.ACC_REG_SRES, AccountHandler.OnRegisterResp);
end

function AccountHandler.OnRespLogin(m)
    local msg = account_pb.RespLogin();
    local data = ByteArray.GetBuffer(m.message);
    msg:ParseFromString(data);

    if msg.msgtips==1001 then
        MessageBox.Open();
        MessageBox.Show("账号不存在");
    elseif msg.msgtips==1002 then
        MessageBox.Open();
        MessageBox.Show("账号已在线");
    elseif msg.msgtips==1003 then
        MessageBox.Open();
        MessageBox.Show("密码错误");
    else
        PlayerCache.id=msg.id;
        PlayerCache.name=msg.account;
        PlayerCache.gold=msg.gold;
        PlayerCache.diamond=msg.diamond;
        PlayerCache.nowRole=msg.roleId;
        table.insert(PlayerCache.role,msg.roleId);
        PlayerCache.roleHp=msg.Hp;
        PlayerCache.roleAtk=msg.atk;
        PlayerCache.roleDef=msg.def;
        --headid=msg.head;
        --armid=msg.arm;
        --chestid=msg.chest;
        --PlayerCache.role=msg.roleHave;

        --PlayerCache.addAtk=msg.addAtk;
        --PlayerCache.addDef=msg.addDef;

        LoginWnd.Close();
        Loading.LoadScene("MainScene");
    end
end


function AccountHandler.OnRegisterResp(m)
    local rsp = account_pb.RespRegister();
    local data = ByteArray.GetBuffer(m.message);
    rsp:ParseFromString(data);
    if rsp.msgtips==1006 then
        MessageBox.Open();
        MessageBox.Show("注册成功");
    else
        MessageBox.Open();
        MessageBox.Show("账号重复");
    end
end
