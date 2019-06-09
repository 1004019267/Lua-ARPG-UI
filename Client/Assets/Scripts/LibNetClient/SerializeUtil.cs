using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using ProtoBuf;

public class SerializeUtil
{
    /// <summary>
    /// 序列化
    /// </summary>
    /// <typeparam name="T"></typeparam>.
    /// 
    /// <param name="value"></param>
    /// <returns></returns>
    public static byte[] Serialize<T>(T value)
    {
        MemoryStream ms = new MemoryStream();
        Serializer.Serialize<T>(ms, value);
        byte[] data = ms.ToArray();//length=27  709

        return data;
    }
    /// <summary>
    /// 反序列化
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="value"></param>
    /// <returns></returns>
    public static T Deserialize<T>(byte[] value) where T : new()
    {
        if (value == null)
        {
            return new T();
        }
        else
        {
            MemoryStream ms1 = new MemoryStream(value);
            T p1 = Serializer.Deserialize<T>(ms1);
            return p1;
        }
    }
}

