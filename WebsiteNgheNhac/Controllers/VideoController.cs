using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
namespace WebsiteNgheNhac.Controllers
{
    public class VideoController : Controller
    {
        // GET: Video
       
       public ActionResult ChiTietVideo()
        {
            ViewBag.ListTheLoai = new TheLoaiDao().ListByAll();
            return View();
        }
    }
}