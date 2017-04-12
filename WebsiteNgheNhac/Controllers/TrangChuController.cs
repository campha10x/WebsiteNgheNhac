using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EF;
using Model.ViewModel;
using System.Web.Security;

namespace WebsiteNgheNhac.Controllers
{
    public class TrangChuController : Controller
    {
        // GET: TrangChu
        public ActionResult Index()
        {
            var model = new Video_CaSiDao().GetAll();
            ViewBag.SlideGioiThieu = new Slide_GioiThieuDao().ListByAll();
            ViewBag.BaiHatTop = new BaiHat_CasiDao().GetBytop(5);
            ViewBag.ListTheLoai = new TheLoaiDao().ListByAll();

            return View(model);
        }
        [ChildActionOnly]
        public ActionResult Menu()
        {
            var model = new MenuDao().ListByAll();
            return PartialView(model);
        }
        [HttpGet]
        public ActionResult Dangki()
        {
            return PartialView("Dangki");
        }
       [HttpPost]
        public ActionResult Dangki(tbl_NguoiDung obj)
        {
            return PartialView("Dangki");
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
                            
                            //ViewData["CheckDangNhap"] = "true";
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
        public ActionResult Logout()
        {
            TempData["CheckDangNhap"] = "Đăng kí";
            Session.Clear();
                return Json(new
            {
                status = true
            }); 
        }
    }
}