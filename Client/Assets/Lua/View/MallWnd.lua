---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2018/11/1 12:41
---
require "Common/define"
require "pblua/mall_pb"
require("Global.PlayerCache")
MallWnd = {
    btnMall = {};
}
local this = MallWnd
local btnBuy;
local btnReturn;
local img;
local mallCfg;
local mallGold;
local mallDiamond;

local content;
local btnGoods;
--构建函数--
function MallWnd.New()
    return this;
end

function MallWnd.Open()
    panelMgr:CreatePanel("UI", 'MallWnd', this.OnCreate);
end

--启动事件--
function MallWnd.OnCreate(obj)
    gameObject = obj;
    transform = obj.transform;

    behavior = transform:GetComponent('LuaBehaviour');
    btnReturn = transform:Find("Title/BtnReturn").gameObject;
    behavior:AddClick(btnReturn, this.OnBtnReturn);

    mallGold = transform:Find("Title/GoldInfo/TxtGold");
    mallDiamond = transform:Find("Title/GoldInfo/TxtDiamond");
    MallWnd.SetHave(PlayerCache.gold,PlayerCache.diamond);

    content = transform:Find("Scroll View/Viewport/Content");
    btnGoods = transform:Find("Scroll View/Viewport/BtnGoods");

    -- 依据选择副本的配置初始化滚动视图
    for i, v in pairsByKeys(ItemCfg) do
        if type(v) == "table" then
            cfg = ItemCfg[i];

            child = GameObject.Instantiate(btnGoods.gameObject).transform;
            child:SetParent(content);
            child.localScale = Vector3.one;
            child.localPosition = Vector3.zero;
            child.gameObject:SetActive(true);
            child.name = cfg.ID;
            img = resMgr:LoadSprite("Icon", cfg.Icon, cfg.Icon);
            mallCfg = MallCfg.GetMallItemID(cfg.ID);
            child:Find("Image"):GetComponent("Image").overrideSprite = img;
            child:Find("Gold"):GetComponent("Text").text = mallCfg.Gold;
            child:Find("Diamond"):GetComponent("Text").text = mallCfg.Diamond;
            child:Find("Name"):GetComponent("Text").text = cfg.Name;

            -- 给每一个按钮添加事件
            btnBuy = child:Find("BtnBuy");
            btnBuy.name ="BtnBuy"..cfg.ID;
            MallWnd.RefreshButton(child:Find(btnBuy.name).gameObject);
            behavior:AddClick(child:Find(btnBuy.name).gameObject, this.OnBtnBuy);

            behavior:AddClick(child.gameObject, this.OnBtnLook);
        end
    end
end

function MallWnd.OnBtnLook(go)
    local cfg = ItemCfg.GetItemCfg(go.name);
    MessageBox.Open();
    MessageBox.Show("装备名:" .. cfg.Name .. "\n" .. "属性:" .. cfg.AttrValue .. "\n" .. "属性类型:" .. MallWnd.AtkOrDef(cfg.AttrType));
end

function MallWnd.AtkOrDef(type)
    if type== "1" then
        return "攻击";
    elseif type== "2" then
        return "防御";
    end
end

-- 返回按钮的点击事件
function MallWnd.OnBtnReturn(go)
    MallWnd.Close();
end

function MallWnd.OnBtnBuy(go)
    MallWnd.btnMall = nil;
    MallWnd.btnMall = go;
    local req = mall_pb.ReqBuy();
    req.id = PlayerCache.id;
    req.itemId = tonumber(string.sub(go.name,7,10));
    local msg = req:SerializeToString();

    local buffer = ByteArray.New();
    buffer:write(msg);
    networkMgr:SendMessage(msgid.BuyGoods_CREQ, buffer);
end

function MallWnd.RefreshButton(btn)
    for i, v in pairs(PlayerCache.item) do
        if type(i) ~= "table" and string.sub(btn.name,7,10)== v.ID then
            btn:GetComponent("Button").interactable = false;
        end
    end
end

--关闭事件--
function MallWnd.Close()
    panelMgr:ClosePanel(CtrlNames.MallWnd);
end

function MallWnd.SetHave(gold,diamond)
    mallGold:GetComponent("Text").text = gold;
    mallDiamond:GetComponent("Text").text = diamond;
end
