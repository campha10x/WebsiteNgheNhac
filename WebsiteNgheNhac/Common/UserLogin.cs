using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteNgheNhac.Common
{
    [Serializable]
    public class UserLogin
    {
        public long Id { set; get; }
        public string UserName { set; get; }
    }
}