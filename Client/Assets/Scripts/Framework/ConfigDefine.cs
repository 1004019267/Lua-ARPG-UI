

/// <summary>
/// 游戏关卡配置
/// </summary>
public class DungeonCfg
{
    public int ID;
    public string Name;
    public string Scene;
}

/// <summary>
/// 出生点配置
/// </summary>
public class BornPointCfg
{
    public int ID;
    public int LevelID;
    public int RoleID;
    public string Position;
}


/// <summary>
/// 角色配置
/// </summary>
public class RoleCfg
{
    public int ID;
    public string ModelName;
    public string RoleName;
    public string Behavior;         // 角色行为
    public RoleType RoleType;       // 角色类型
    public int Hp;
    public int Mp;
    public float MoveSpeed;         // 移动速度
    public float AttackSpeed;       // 攻击速度
    public float Defend;            // 防御力
    public float Sight;             // 视野
    public string IdleAnim;         // 待机动画
    public string MoveAnim;         // 移动动画
}

/// <summary>
/// 技能组配置
/// </summary>
public class SkillGroupCfg
{
    public int ID;
    public int RoleID;
    public int Index;
}


/// <summary>
/// 技能基础配置
/// </summary>
public class SkillBasicCfg
{
    public int ID;
    public string Name;
    public string Desc;
    public bool NeedTarget;             // 是否需要攻击目标
    public bool CanMove;                // 施法时是否可移动
    public int BasicNum;
    public string AnimName;
    public float CD;
    public float HitTime;               // 命中时间
    public int HitNum;                  // 攻击次数
    public float HitInterval;           // 攻击间隔
    public SkillType SkillType;         // 技能类型
    public float MaxRange;              // 最大攻击范围
    public AffectSide AffectSide;       // 作用的阵营
    public IgnoreType IgnoreTarget;     // 忽略的目标类型
    public string CastEffect;           // 释放效果
}

/// <summary>
/// 子弹配置
/// </summary>
public class SkillBulletCfg
{
    public int ID;
    public BulletType BulletType;
    public int SplitNum;                // 分裂箭的数量
    public float SplitAngle;            // 分裂箭的角度
    public float FlyRange;              // 最大飞行距离
    public bool FlyPierce;              // 可穿透
    public float FlySpeedH;             // 水平速度
    public float FlySpeedV;             // 垂直速度
    public bool FlyTrack;               // 是否跟踪
    public int FlyBounceNum;            // 弹射次数

    public string BulletEffect;         // 子弹特效
}

/// <summary>
/// 范围技能配置
/// </summary>
public class SkillAOECfg
{
    public int ID;
    public AreaType AreaCenter;         // 范围中心类型
    public AreaShape AreaShape;         // 范围形状
    public float AreaArg1;
    public float AreaArg2;
    public string AOEEffect;            // 释放的效果
}

/// <summary>
/// Buff配置
/// </summary>
public class SkillBuffCfg
{
    public int ID;
    public BuffType Type;               // Buff类型
    public AttrType AttrType;           // 修改的属性类型
    public float AttrValue;             // 修改的属性值
    public float Duration;              // Buff持续时间
    public ControlEffect Control;       // 控制效果
    public string Effect;               // Buff释放效果
}

/// <summary>
/// 陷阱
/// </summary>
public class SkillTrapCfg
{
    public int ID;
    public AreaType AreaCenter;         // 范围中心类型
    public AreaShape AreaShape;         // 范围形状
    public float AreaArg1;
    public float AreaArg2;
    public float Duration;              // 持续时间
    public float Interval;              // 陷阱伤害作用间隔
    public int Damage;                  // 伤害
    public string Effect;               // 陷阱效果
}

/// <summary>
/// 消息提示配置
/// </summary>
public class MsgTipsCfg
{
    public int ID;
    public string Value; 
}

public class ItemCfg
{
    public int ID;
    public ItemType ItemType;   // 物品类型
    public EquipType EquipType; // 装备类型
    public string Name;         // 物品名
    public string Icon;         // 图标名称
    public int AttrType;        // 增加的属性类型
    public int AttrValue;       // 增加的属性值
}