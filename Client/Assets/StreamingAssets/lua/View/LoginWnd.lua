
require "Common/define"
--require "3rd/pbc/protobuf"
require "pblua/account_pb"


LoginWnd = {};
local this = LoginWnd;


local behavior;

local transform;
local gameObject;

local inputacc;
local inputpwd;
local btnRegister;
local btnLogin;

--构建函数--
function LoginWnd.New()
	return this;
end

function LoginWnd.Open()
	panelMgr:CreatePanel("UI", 'LoginWnd', this.OnCreate);
end

--启动事件--
function LoginWnd.OnCreate(obj)
	gameObject = obj;
	transform = obj.transform;

	inputacc = transform:Find("Acc"):GetComponent("InputField");
	inputpwd = transform:Find("Pwd"):GetComponent("InputField");
	btnRegister = transform:Find("BtnRegister").gameObject;
	btnLogin = transform:Find("BtnLogin").gameObject;


	behavior = transform:GetComponent('LuaBehaviour');
	behavior:AddClick(btnRegister, this.OnRegisterBtnClick);
	behavior:AddClick(btnLogin, this.OnLoginBtnClick);
end

--初始化面板--
function LoginWnd.InitPanel(objs)
	local count = 100; 
	local parent = this.gridParent;
	for i = 1, count do
		local go = newObject(objs[0]);
		go.name = 'Item'..tostring(i);
		go.transform:SetParent(parent);
		go.transform.localScale = Vector3.one;
		go.transform.localPosition = Vector3.zero;
		behavior:AddClick(go, this.OnItemClick);

	    local label = go.transform:Find('Text');
	    label:GetComponent('Text').text = tostring(i);
	end
end

--滚动项单击--
function LoginWnd.OnItemClick(go)
    log(go.name);
end

function LoginWnd.OnRegisterBtnClick(go)


	local req = account_pb.ReqRegister();
	req.account = inputacc.text;
	req.password = inputpwd.text;

	local msg = req:SerializeToString();

	local buffer = ByteArray.New();
	buffer:write(msg);
	networkMgr:SendMessage(msgid.ACC_REG_CREQ, buffer);
end


function LoginWnd.OnLoginBtnClick(go)

	local req = account_pb.ReqLogin();
	req.account = inputacc.text;
	req.password = inputpwd.text;

	local msg = req:SerializeToString();

	local buffer = ByteArray.New();
	buffer:write(msg);
	networkMgr:SendMessage(msgid.ACC_LOGIN_CREQ, buffer);
    logWarn("OnClick---->>>"..go.name);
end


--关闭事件--
function LoginWnd.Close()
	panelMgr:ClosePanel(CtrlNames.LoginWnd);
end