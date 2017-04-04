using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
namespace WebsiteNgheNhac.Controllers
{
    public class NgheNhacController : Controller
    {
        // GET: NgheNhac
        public ActionResult Index(long Id)
        {
            ViewBag.ListTheLoai = new TheLoaiDao().ListByAll();
            ViewBag.BaiHatTop = new BaiHat_CasiDao().GetBytop(20);
            return View();
        }
    }
}