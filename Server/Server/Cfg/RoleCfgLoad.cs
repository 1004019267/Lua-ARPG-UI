using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class RoleCfgLoad : Singleton<RoleCfgLoad>
{
    ConfigParser cfgRole = new ConfigParser();
    public Dictionary<int, RoleCfg1> roleCfg = new Dictionary<int, RoleCfg1>();
    public void Init()
    {
        roleCfg = cfgRole.LoadConfig<RoleCfg1>("Role");
    }

    public RoleCfg1 GetRoleID(int id)
    {
        return roleCfg[id];
    }
}

