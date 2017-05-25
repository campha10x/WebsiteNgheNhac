using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using System.IO;

namespace WebsiteNgheNhac.Controllers
{
    public class NgheNhacController : Controller
    {
        // GET: NgheNhac
        [OutputCache(Duration = int.MaxValue, VaryByParam = "Id", Location = System.Web.UI.OutputCacheLocation.Server)]
        public ActionResult Index(long Id)
        {
            ViewBag.ListTheLoai = new TheLoaiDao().ListByAll();
            ViewBag.BaiHatTop = new BaiHat_CasiDao().GetBytop(20);

            new BaiHatDao().Update_LuotNghe(Id);
            var model = new BaiHat_CasiDao().GetById(Id);
            return View(model);
        }
        //[HttpGet]
        public ActionResult DownloadFile(string filename)
        {
            if (Path.GetExtension(filename) == ".")
            {
                string fullPath = Path.Combine(Server.MapPath("/asset/client/Audio_Video/Audio/"), filename);
                return File(fullPath, "mp3");
            }
            else
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.Forbidden);
        }
        [HttpGet]
        public ActionResult Search(string keyword)
        {
            ViewData["keyword"] = keyword;
            ViewBag.BaiHatSearch = new BaiHat_CasiDao().GetByName(keyword);
            ViewBag.ListTheLoai = new TheLoaiDao().ListByAll();
            return View();
        }
    }
}