using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EF;
using Model.ViewModel;
using System.Web.Security;
using Facebook;
using System.Configuration;
using BotDetect.Web.Mvc;
using System.Web.UI;

namespace WebsiteNgheNhac.Controllers
{
    public class TrangChuController : Controller
    {
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }
        // GET: TrangChu
        public ActionResult Index()
        {
            var model = new Video_CaSiDao().Get_Ord_1();
             ViewBag.Video_Ord2= new Video_CaSiDao().Get_Ord_2();
            ViewBag.SlideGioiThieu = new Slide_GioiThieuDao().ListByAll();
            ViewBag.BaiHatTop = new BaiHat_CasiDao().GetBytop(5);
            ViewBag.ListTheLoai = new TheLoaiDao().ListByAll();
            ViewBag.ListTinTuc = new TinTucDao().GetByTop(4);
            return View(model);
        }

        [ChildActionOnly]
        [OutputCache(Duration =3600*24)]
        public ActionResult Menu()
        {
            var model = new MenuDao().ListByAll();
            return PartialView(model);
        }
       [HttpPost]
        [CaptchaValidation("CaptchaCode", "registorCapcha", "Mã xác nhận không đúng")]
        public JsonResult Dangki(tbl_NguoiDung obj)
        {
            if (!ModelState.IsValid)
            {
                var dao = new NguoiDungDao();
                if (dao.CheckUserName(obj.TaiKhoan))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else if (dao.CheckEmail(obj.Email))
                {
                    ModelState.AddModelError("", "Email đã tồn tại");
                }
                else
                {
                    var user = new tbl_NguoiDung();
                    user.Active = true;
                    user.TaiKhoan = obj.TaiKhoan;
                    user.MatKhau = obj.MatKhau;
                    user.Email = obj.Email;
                    var result = dao.Insert(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Đăng ký thành công";
                        obj = new tbl_NguoiDung();
                        return Json(new
                        {
                            status = true
                        });
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công. ");
                    }
                }
            }
            return Json(new
            {
                status = false
            });
        }
        //[HttpPost]
        //public ActionResult DangNhap(FormCollection f)
        //{
        //    tbl_NguoiDung obj = new tbl_NguoiDung();
        //    obj.TaiKhoan = f["txttaikhoan"].ToString();
        //    obj.MatKhau = f["txtmatkhau"].ToString();
        //    bool check = new NguoiDungDao().Check_DangNhap(obj);
        //    if (check == true)
        //    {
        //        Session["TaiKhoan"] = obj;
        //        return View("Index", "TrangChu");
        //    }
        //    else
        //    {
        //        ViewBag.ThongBao = "Tên tài khoản hoặc mật khẩu không đúng!!!";
        //        return View("DangNhap");
        //    }

        //}
        [HttpPost]
        public JsonResult DangNhap(string Username, string Password,bool RememberPass)
        {
            if(ModelState.IsValid)
            {
                using (tbl_NguoiDung obj = new tbl_NguoiDung())
                {
                    obj.TaiKhoan = Username;
                    obj.MatKhau = Password;
                    bool check = new NguoiDungDao().Check_DangNhap(obj);
                    if (check == true)
                    {
                        Session["TaiKhoan"] = Username;
                        if (RememberPass == true)
                        {
                            
                            HttpCookie ckUsername = new HttpCookie("TaiKhoan");
                            ckUsername.Expires = DateTime.Now.AddSeconds(3600);
                            ckUsername.Value = obj.TaiKhoan;
                            Response.Cookies.Add(ckUsername);
                            HttpCookie ckPassword = new HttpCookie("Password");
                            ckPassword.Expires = DateTime.Now.AddSeconds(3600);
                            ckPassword.Value = obj.MatKhau;
                            Response.Cookies.Add(ckPassword);
                        }
                        TempData["CheckDangNhap"] = "Thoát";
                        return Json(new
                        {
                            status = true
                        });
                    }
                    else
                    {
                        return Json(new
                        {
                            status = false
                        });
                    }
                }
            }
            return Json(new
            {
                status = false
            });
        }
        
        public ActionResult LoginFacebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri=RedirectUri.AbsoluteUri,
                response_type="code",
                scope="email"
             
            });
            return Redirect(loginUrl.AbsoluteUri);
        }
        
        public ActionResult FacebookCallback(string code)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret=ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri= RedirectUri.AbsoluteUri,
                code=code
            });

            var accessToken = result.access_token;
            if(!string.IsNullOrEmpty(accessToken))
            {
                fb.AccessToken = accessToken;
                dynamic me = fb.Get("me?fields=first_name,middle_name,last_name,id,email");
                string email = me.email;
                //string userName = me.last_name;
                string firstname = me.first_name;
                string middlename = me.middle_name;
                string lastname = me.last_name;
                string id_fb = me.id;

               
                var user = new tbl_NguoiDung();
                user.Email = email;
                user.TaiKhoan = firstname + " " + middlename + " " + lastname;
                user.HoTen = firstname + " " + middlename + " " + lastname;
                user.Active = true;
                user.Fb = id_fb;
                //long id = new NguoiDungDao().Get_MaxId();
                //user.Id = id;
                long Id = new NguoiDungDao().InsertForFacebook(user);
                if(Id > 0)
                {
                    TempData["CheckDangNhap"] = "Thoát";
                    Session["TaiKhoan"] = user.TaiKhoan;
                }

            }
            return RedirectToAction("Index");
        }

        public ActionResult Logout()
        {
            TempData["CheckDangNhap"] = null;
            Session.Clear();
                return Json(new
            {
                status = true
            }); 
        }
        public JsonResult ListName(string q)
        {
            var data = new BaiHatDao().ListName(q);
            return Json(new
            {
                data = data,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
       
    }
}