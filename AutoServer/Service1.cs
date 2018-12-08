using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace AutoServer
{
    public partial class Service1 : ServiceBase
    {
        System.Timers.Timer sendtimer = new System.Timers.Timer();
        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            TestSendEmail();
            //定时检查发邮件
            //Thread tcp = new Thread(new ThreadStart(TimerSend));
            //tcp.Start();
        }

        protected void TestSendEmail()
        {
            try
            {
                System.Text.StringBuilder strBody = new System.Text.StringBuilder();//邮件内容
                strBody.Append("点击下面链接激活账号，8848小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！");
                strBody.Append("点击这里");
                strBody.Append("如未能激活请点击下面链接：http://localhost:38216/Validate.aspx?Account=&ValidateCode=" + Decryption.Encrypt("2") + "");
                string attachPath = @"H:/新建文件夹/demo.txt";
                //qfahmjmzxheobaih
                Email email = new Email("smtp.qq.com", "1034342519@qq.com", "467457110@qq.com", "邮箱验证", strBody.ToString(), "467457110", "qxtrjmpotwrzcajb", "587", true, true);
                email.AddAttachments(attachPath);
                email.Send();
            }
            catch (Exception ex)
            {
                
                throw;
            }
          
        }

        /// <summary>
        /// 发送邮件定时循环
        /// </summary>
        protected void TimerSend()
        {
            sendtimer.Elapsed += new System.Timers.ElapsedEventHandler(IntervalSend);
            sendtimer.Interval = 1000;//1秒
            sendtimer.Start();
            sendtimer.AutoReset = true;
            sendtimer.Enabled = true;
        }
        protected void IntervalSend(object sender, System.Timers.ElapsedEventArgs e)
        {
            sendtimer.Enabled = false;
            
            sendtimer.Enabled = true;
        }

        protected override void OnStop()
        {
            Console.ReadLine();
        }

        public void DebugStop()
        {
            this.OnStop();
        }
        public void DebugStart(string[] args)
        {
            this.OnStart(args);
        }
    }
}
