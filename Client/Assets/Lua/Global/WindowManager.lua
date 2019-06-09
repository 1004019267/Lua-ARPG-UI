require "Common/define"
require "View/LoginWnd"
require "View/MessageBox"
require "View/LoadingWnd"
require("View.MainWnd")
require("View.BattleWnd")
require("View.SelectDungeonWnd")
require("View.BagWnd")
require("View.RoleWnd")
require("View.MallWnd")

require "Common/define"
CtrlNames =
{
	MessageBox = "MessageBox",
	LoadingWnd = "LoadingWnd",
	LoginWnd = "LoginWnd",
	MainWnd = "MainWnd",
	BagWnd="BagWnd",
	MallWnd="MallWnd",
	RoleWnd="RoleWnd",
	BattleWnd = "BattleWnd",
	SelectDungeonWnd = "SelectDungeonWnd",
}


WindowManager = {};
local this = WindowManager;
local ctrlList = {};	--界面列表--

local updateList = {};

function WindowManager.Init()

	ctrlList[CtrlNames.LoginWnd] = LoginWnd.New();
	ctrlList[CtrlNames.MessageBox] = MessageBox.New();
	ctrlList[CtrlNames.LoadingWnd] = LoadingWnd.New();
	ctrlList[CtrlNames.MainWnd] = MainWnd.New();
	ctrlList[CtrlNames.SelectDungeonWnd] = SelectDungeonWnd.New();
	ctrlList[CtrlNames.BagWnd]=BagWnd.New();
	ctrlList[CtrlNames.MallWnd]=MallWnd.New();
	ctrlList[CtrlNames.RoleWnd]=RoleWnd.New();
	updateList[CtrlNames.LoadingWnd] = LoadingWnd;
	return this;
end

function WindowManager.Update(dt)
	for i, v in pairs(updateList) do
		v.Update(dt);
	end
end

--添加界面--
function WindowManager.AddWnd(ctrlName, ctrlObj)
	ctrlList[ctrlName] = ctrlObj;
end

--获取界面--
function WindowManager.GetWnd(ctrlName)
	return ctrlList[ctrlName];
end

--移除界面--
function WindowManager.RemoveWnd(ctrlName)
	ctrlList[ctrlName] = nil;
end

--关闭界面--
function WindowManager.Close()
	logWarn('WindowManager.Close---->>>');
end