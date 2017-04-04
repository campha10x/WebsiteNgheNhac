using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EF;
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

        public ActionResult frm_NgheNhac(long id)
        {
            //var Nhacmp3 = new
            return View();
        }
    }
}