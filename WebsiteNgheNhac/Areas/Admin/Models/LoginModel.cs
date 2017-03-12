using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebsiteNgheNhac.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage ="Mời nhập username")]
        public string UserName { set; get; }

        [Required(ErrorMessage ="Mời nhập pasword")]
        public string Password { set; get; }

        public bool RememberMe { set; get; }
    }
}