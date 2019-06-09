using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


public class MallCfgLoad :  Singleton<MallCfgLoad>
{   
    ConfigParser cfgMall = new ConfigParser();
    public Dictionary<int, MallCfg> mallCfg = new Dictionary<int, MallCfg>();
    public void Init()
    {
       mallCfg=cfgMall.LoadConfig<MallCfg>("Mall");
    }

    public MallCfg GetMallItemID(int itemId)
    {
        foreach (var item in mallCfg)
        {
            if (item.Value.ItemID==itemId)
            {
              return item.Value;
            }
        }
        return null;
    }
}

