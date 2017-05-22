using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
namespace WebsiteNgheNhac.Areas.Admin.Controllers
{
    public class VideoController : Controller
    {
        // GET: Admin/Video
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new VideoDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
    }
}