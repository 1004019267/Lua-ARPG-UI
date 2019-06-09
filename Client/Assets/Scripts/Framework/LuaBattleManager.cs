using System;
using System.Collections.Generic;


public class LuaBattleManager : Singleton<LuaBattleManager>
{

    private BattleWnd battleWnd;

    /// <summary>
    /// 战斗开始
    /// </summary>
    /// <param name="battleid">战斗配置id</param>
    /// <param name="playercfgid">玩家配置id</param>
    public void BattleStart(int battleid, int playercfgid)
    {
        battleWnd = new BattleWnd();

        Dictionary<int, BornPointCfg> bpcs = ConfigManager.instance.GetBornPoints(battleid);
        foreach(BornPointCfg bpc in bpcs.Values)
        {
            int roleid = bpc.RoleID == 0 ?  playercfgid : bpc.RoleID;

            // 通过角色ID获取角色配置
            RoleCfg roleCfg = ConfigManager.instance.GetRoleCfg(roleid);

            // 创建角色
            Character character = CharacterManager.instance.Create(roleCfg, MathTools.GetPosition(bpc.Position));
           //character.GlobalID = _idcounter++;
            character.side = roleCfg.RoleType == RoleType.Player ? RoleSide.Blue : RoleSide.Red;

            // 战斗界面监听战斗中的事件
            character.hpChanged = battleWnd.CreateBloodText;
            character.characterDie = battleWnd.OnCharacterDie;

            // 角色创建
            battleWnd.OnCharacterCreate(character);

            CharacterManager.instance.AddCharacter(character.GlobalID, character);
        }
    }

    public void Update(float dt)
    {
        CharacterManager.instance.Update(dt);
        SkillManager.instance.Update(dt);

        if(battleWnd != null)
            battleWnd.Update(dt);
    }

    public void BattleEnd()
    {
        CharacterManager.instance.Clear();
        SkillManager.instance.Clear();
        PoolManager.instance.Clear();
    }
}

