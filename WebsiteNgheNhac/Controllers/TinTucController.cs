using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
namespace WebsiteNgheNhac.Controllers
{
    public class TinTucController : Controller
    {
        // GET: TinTuc
        public ActionResult Index(int Id)
        {
            ViewBag.GetTinTuc = new TinTucDao().GetByTintuc(Id);
            ViewBag.ListTheLoai = new TheLoaiDao().ListByAll();
            ViewBag.ListTinTuc = new TinTucDao().GetByListTinTucx(Id,3);
            return View();
        }
        public ActionResult ListTinTuc()
        {
            ViewBag.ListTinTuc = new TinTucDao().GetByTop(10);
            ViewBag.ListTheLoai = new TheLoaiDao().ListByAll();
            return View();
        }
    }
}