using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;

namespace AutoServer
{
    static class Program
    {
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        static void Main(string[] args)
        {
            Service1 s = new Service1();
            if (Environment.UserInteractive)
            {
                try
                {
                    s.DebugStart(args);
                    s.DebugStop();
                }
                catch (System.Exception ex)
                {

                }
            }
            else
            {
                ServiceBase[] ServicesToRun;
                ServicesToRun = new ServiceBase[] 
			    { 
				    new Service1() 
			    };
                ServiceBase.Run(ServicesToRun);
            }
        }
    }
}
