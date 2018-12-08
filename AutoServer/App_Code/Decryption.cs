using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Decryption 的摘要说明
/// </summary>
public static class Decryption
{
    private static byte[] key = { 0x21, 0x43, 0x65, 0x87, 0x09, 0xBA, 0xDC, 0xFE };
    private static byte[] IV = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };

    /// <summary>  
    /// 加密处理  
    /// </summary>  
    /// <param name="Input"></param>  
    /// <returns></returns>  
    public static string Encrypt(string Input)
    {
        try
        {
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            Byte[] inputByteArray = Encoding.UTF8.GetBytes(Input);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(key, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            return Convert.ToBase64String(ms.ToArray());
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    /// <summary>  
    /// 解密处理  
    /// </summary>  
    /// <param name="Input"></param>  
    /// <returns></returns>  
    public static string Decrypt(string Input)
    {
        if (!string.IsNullOrEmpty(Input))
        {
            Input = Input.Replace(" ", "+");
            Byte[] inputByteArray = new Byte[Input.Length];
            try
            {
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                inputByteArray = Convert.FromBase64String(Input);
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                Encoding encoding = Encoding.UTF8;
                return encoding.GetString(ms.ToArray());
            }
            catch (Exception ex)
            {
                return "";
            }
        }
        else
        {
            return "";
        }
    }
}