using System;
using System.Collections.Generic;

using System.Text;

public class SocketModel
{
    // 消息ID
    public int command { get; set; }


    // 消息体 当前需要处理的主体数据
    public byte[] message { get; set; }

    public SocketModel() { }
    public SocketModel(byte t, int a, int c, byte[] o)
    {
        //this.type = t;
        //this.area = a;
        this.command = c;
        this.message = o;
    }
}

