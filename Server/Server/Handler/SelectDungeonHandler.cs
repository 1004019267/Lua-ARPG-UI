using System;
using System.Collections.Generic;

using selectdungeon;
public class SelectDungeonHandler : IMsgHandler
{
    public void RegisterMsg(Dictionary<MsgID, Action<UserToken, SocketModel>> handlers)
    {      
        handlers.Add(MsgID.ReqSelectDungeon, OnSelectDungeon);
        handlers.Add(MsgID.ReqLeaveDungeon, OnLeaveDungeon);
    }

    private void OnSelectDungeon(UserToken token, SocketModel m)
    {
        ReqSelectDungeon req = SerializeUtil.Deserialize<ReqSelectDungeon>(m.message);

        Console.WriteLine(req.dungeonid);

        RspSelectDungeon rsp = new RspSelectDungeon();
        rsp.dungeonid = req.dungeonid;

        NetworkManager.Send<RspSelectDungeon>(token, (int)MsgID.RspSelectDungeon, rsp);
    }

    private void OnLeaveDungeon(UserToken token, SocketModel m)
    {
        ReqLeaveDungeon req = SerializeUtil.Deserialize<ReqLeaveDungeon>(m.message);

        Console.WriteLine(req.dungeonid);

        RspLeveaDungeon rsp = new RspLeveaDungeon();
        rsp.dungeonid = req.dungeonid;

        NetworkManager.Send<RspLeveaDungeon>(token, (int)MsgID.RspLeveaDungeon, rsp);
    }
}