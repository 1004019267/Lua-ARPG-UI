---
--- Created by shang.
--- DateTime: 2017/12/21 11:46
---

Login = {}
local this = Login;

---初始化
function Login.Initialize()

    --- 打开登录界面
    local loginwnd = WindowManager.GetWnd("LoginWnd");
    loginwnd:Open()
end


--- 结束
function Login.Finalize()

end
