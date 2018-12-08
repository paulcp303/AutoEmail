using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;

/// <summary>
/// Email 的摘要说明
/// </summary>
public class Email
{
    private MailMessage mMailMessage;   //主要处理发送邮件的内容（如：收发人地址、标题、主体、图片等等）
    private SmtpClient mSmtpClient; //主要处理用smtp方式发送此邮件的配置信息（如：邮件服务器、发送端口号、验证方式等等）
    private int mSenderPort;   //发送邮件所用的端口号（htmp协议默认为25）
    private string mSenderServerHost;    //发件箱的邮件服务器地址（IP形式或字符串形式均可）
    private string mSenderPassword;    //发件箱的密码
    private string mSenderUsername;   //发件箱的用户名（即@符号前面的字符串，例如：hello@163.com，用户名为：hello）
    private bool mEnableSsl;    //是否对邮件内容进行socket层加密传输
    private bool mEnablePwdAuthentication;  //是否对发件人邮箱进行密码验证
    public Email(string server, string toMail, string fromMail, string subject, string emailBody, string username, string password, string port, bool sslEnable, bool pwdCheckEnable)
    {
        try
        {
            mMailMessage = new MailMessage();
            mMailMessage.To.Add(toMail);
            mMailMessage.From = new MailAddress(fromMail);
            mMailMessage.Subject = subject;
            mMailMessage.Body = emailBody;
            mMailMessage.IsBodyHtml = true;
            mMailMessage.BodyEncoding = System.Text.Encoding.UTF8;
            mMailMessage.Priority = MailPriority.Normal;
            this.mSenderServerHost = server;
            this.mSenderUsername = username;
            this.mSenderPassword = password;
            this.mSenderPort = Convert.ToInt32(port);
            this.mEnableSsl = sslEnable;
            this.mEnablePwdAuthentication = pwdCheckEnable;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
        }
    }

    public string  Send()
    {
        string result = "1";
        try
        {
            if (mMailMessage != null)
            {
                mSmtpClient = new SmtpClient();
                //mSmtpClient.Host = "smtp." + mMailMessage.From.Host;
                mSmtpClient.Host = this.mSenderServerHost;
                mSmtpClient.Port = this.mSenderPort;
                mSmtpClient.UseDefaultCredentials = false;
                mSmtpClient.EnableSsl = this.mEnableSsl;
                if (this.mEnablePwdAuthentication)
                {
                    System.Net.NetworkCredential nc = new System.Net.NetworkCredential(this.mSenderUsername, this.mSenderPassword);
                    //mSmtpClient.Credentials = new System.Net.NetworkCredential(this.mSenderUsername, this.mSenderPassword);
                    //NTLM: Secure Password Authentication in Microsoft Outlook Express
                    mSmtpClient.Credentials = nc.GetCredential(mSmtpClient.Host, mSmtpClient.Port, "NTLM");
                }
                else
                {
                    mSmtpClient.Credentials = new System.Net.NetworkCredential(this.mSenderUsername, this.mSenderPassword);
                }
                mSmtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                ServicePointManager.ServerCertificateValidationCallback = delegate(Object obj, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors) { return true; };
                mSmtpClient.Send(mMailMessage);
            }
        }
        catch (Exception ex)
        {
            result = "0";
            //m_CreateErrorLogTxt("程序池(Email)通知", "邮件发送失败", ex.Message);
        }
        return result;
    }

}