using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// WebService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string SendEmail(string tomail) {
        string result = "0";
        try
        {
            //var appSettings = System.Configuration.ConfigurationManager.AppSettings;//获取config配置信息               
            //string senderServerIp = appSettings["senderServerIp"];//发送地址服务器
            //string toMailAddress = tomail;//接受方地址
            //string fromMailAddress = appSettings["fromMailAddress"];//发送方地址
            //string mailUsername = appSettings["mailUsername"]; //发送账户
            //string mailPassword = appSettings["mailPassword"]; //发送邮箱的密码
            //string mailPort = appSettings["mailPort"];//发送服务器端口号
            //System.Text.StringBuilder strBody = new System.Text.StringBuilder();//邮件内容
            //strBody.Append("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！");
            //strBody.Append("点击这里");
            //strBody.Append("如未能激活请点击下面链接：http://localhost:38216/Validate.aspx?Account=" + TextBox2.Text + "&ValidateCode=" + Decryption.Encrypt(validateCode) + "");
            //Email email = new Email(senderServerIp, toMailAddress, fromMailAddress, "邮箱验证", strBody.ToString(), mailUsername, mailPassword, mailPort, true, true);
            //email.Send();
        }
        catch (Exception ex)
        {
        }
        return "Hello World";
    }
    
}
