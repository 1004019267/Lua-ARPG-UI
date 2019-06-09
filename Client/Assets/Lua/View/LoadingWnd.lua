---
--- Created by shang.
--- DateTime: 2017/12/21 12:14
---

require "Common/define"

LoadingWnd = {};
local this = LoadingWnd;

local gameObject;
local transform;

local elapsedTime = 0;
local totalTime = 2;

local slider;

local open = false;

function LoadingWnd.New()
    return this;
end

function LoadingWnd.Open()
    panelMgr:CreatePanel("UI", "LoadingWnd", this.OnCreate);

    open = true;
end

function LoadingWnd.OnCreate(obj)
    gameObject = obj;
    transform = gameObject.transform;
    slider = transform:Find("Slider"):GetComponent("Slider");
    elapsedTime = 0;
end

function LoadingWnd.Update(dt)
    if  open == true then
        slider.value = elapsedTime / totalTime;
        elapsedTime = elapsedTime + dt;
    end
end

function LoadingWnd.Close()
    open = false;

    slider.value = 0;
    elapsedTime = 0;

    destroy(gameObject);
end

