using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


class ItemCfgLoad :Singleton<ItemCfgLoad>
{

    ConfigParser cfgRole = new ConfigParser();
    public Dictionary<int, ItemCfg> itemCfg = new Dictionary<int, ItemCfg>();
    public void Init()
    {
        itemCfg = cfgRole.LoadConfig<ItemCfg>("Item");
    }

    public ItemCfg GetItemID(int id)
    {
        return itemCfg[id];
    }
}

