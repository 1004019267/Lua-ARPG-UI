MessageBox = {};
local this = MessageBox;

local behavior;
local transform;
local gameObject;
local btnClose;
local content;

--构建函数--
function MessageBox.New()
    return this;
end

function MessageBox.Open()
    panelMgr:CreatePanel("UI", "MessageBox", this.OnCreate);
end

--启动事件--
function MessageBox.OnCreate(obj)
    gameObject = obj;
    transform = gameObject.transform;

    this.btnClose = transform:Find("BtnOK").gameObject;
    this.content = transform:Find("Content"):GetComponent("Text");


    behavior = gameObject:GetComponent('LuaBehaviour');
    behavior:AddClick(this.btnClose, this.OnClick);

end

function MessageBox.Show(m)
    this.content.text = m;
end

--单击事件--
function MessageBox.OnClick(go)
    MessageBox.Close();
end

--关闭事件--
function MessageBox.Close()
    panelMgr:ClosePanel(CtrlNames.MessageBox);
end