---
--- Created by shang.
--- DateTime: 2017/12/21 11:45
---

require "View/LoadingWnd"
require "Common/define"

Loading = {}
local this = Loading;

---初始化
function Loading.Initialize()
    LoadingWnd.Open();
    timerMgr:Invoke(2, this.OnDelay);
end

function Loading.OnDelay()
    SceneManager.LoadScene(this.nextscene);
    LoadingWnd.Close();
end

function Loading.LoadScene(scene)
    this.nextscene = scene;
    SceneManager.LoadScene("Loading");
end

