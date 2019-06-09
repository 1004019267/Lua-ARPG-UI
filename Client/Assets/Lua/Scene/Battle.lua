---
--- Created by shang.
--- DateTime: 2017/12/21 11:46
---

require( "View.BattleWnd")
Battle = {}

local this = Battle;

function Battle.Initialize()
    BattleWnd.Open();
end

function Battle.Finalize()
    BattleWnd.Close()
end