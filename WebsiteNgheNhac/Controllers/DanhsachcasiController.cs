using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
namespace WebsiteNgheNhac.Controllers
{
    public class DanhsachcasiController : Controller
    {
        // GET: Danhsachcasi
        public ActionResult Index()
        {
            ViewBag.ListCaSi = new CaSiDao().ListByAll();
            ViewBag.ListTheLoai = new TheLoaiDao().ListByAll();
            return View();
        }
        public ActionResult Thongtincasi(long Id)
        {
            ViewBag.GetCaSi = new CaSiDao().GetByList(Id);
            ViewBag.ListTheLoai = new TheLoaiDao().ListByAll();
            ViewBag.GetListBaiHat = new BaiHatDao().GetListBH(Id);
            ViewBag.ListVideo = new Video_CaSiDao().GetListVideo(Id);
            return View();
        }
    }
}