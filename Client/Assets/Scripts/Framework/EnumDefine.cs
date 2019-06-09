using System;
using System.Collections.Generic;


/// <summary>
/// 角色类型
/// </summary>
public enum RoleType
{
    None = 0,
    Player = 1,
    Npc = 2,
    Monster = 3
}

/// <summary>
/// 阵营
/// </summary>
public enum RoleSide
{
    None = 0,
    Blue = 1,
    Red = 2,
    Neutral = 3
}

public enum SkillType
{
    None = 0,
    Active = 1,     // 主动技能
    Passive = 2,    // 被动技能
    Aureole = 3     // 友方光环 
}


/// <summary>
/// 作用的阵营
/// </summary>
public enum AffectSide
{
    None = 0,
    Friend = 1,
    Enemy = 2
}

/// <summary>
/// 范围中心类型
/// </summary>
public enum AreaType
{
    None = 0,
    Self = 1,
    Target = 2,
    Mouse = 3
}

/// <summary>
/// 范围形状
/// </summary>
public enum AreaShape
{
    None = 0,
    Circle = 1,
    Rect = 2,
    Fan = 3
}

/// <summary>
/// 子弹类型
/// </summary>
public enum BulletType
{
    None = 0,
    Cast = 1,           // 投射
    Bounce = 2,         // 弹射
    Multiple = 3,       // 多重箭
    Split = 4,          // 分裂箭
    Boomerang = 5       // 回旋镖
}

/// <summary>
/// 忽略的目标类型
/// </summary>
public enum IgnoreType
{
    None = 0,
    Hero = 1,
    Soldier = 2,
    Monster = 3,
    Tower = 4
}

/// <summary>
/// Buff类型
/// </summary>
public enum BuffType
{
    None = 0,
    Attribute = 1,  // 属性Buff
    Control = 2     // 控制效果
}

/// <summary>
/// Buff可以修改的属性类型
/// </summary>
public enum AttrType
{
    None = 0,
    MoveSpeed = 1,
    AttackSpeed = 2,
    Damage = 3,
    Defend = 4
}

/// <summary>
/// 控制效果
/// </summary>
public enum ControlEffect
{
    None = 0,
    Vertigo = 1,        // 眩晕
    Silence = 2,        // 沉默
    Freeze = 3,         // 禁锢
}

/// <summary>
/// 装备类型
/// </summary>
public enum EquipType
{
    Helmet = 0,         // 头盔
    Shoulder = 1,       // 肩甲
    Chest = 2,          // 胸甲
    Belt = 3,           // 腰带
    Pants = 4,          // 裤子
    Boot = 5            // 鞋子
}

/// <summary>
/// 物品类型
/// </summary>
public enum ItemType
{
    None = 0,
    Equip = 1,          // 装备
    Consume = 2,        // 消耗品
    Quest = 3,          // 任务物品
    Material = 4        // 材料 
}