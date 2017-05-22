using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.ViewModel;
namespace WebsiteNgheNhac.Controllers
{
    public class VideoController : Controller
    {
        // GET: Video
       
       public ActionResult ChiTietVideo(long Id)
        {
            List<Video_CaSiModel> lst_Video_CaSi = new List<Video_CaSiModel>();
              lst_Video_CaSi = new Video_CaSiDao().GetById(Id);
            ViewBag.ListTheLoai = new TheLoaiDao().ListByAll();
            ViewBag.Video = lst_Video_CaSi;
            long ID_Casi = lst_Video_CaSi.First().ID_Casi;
            ViewBag.ListVideo = new Video_CaSiDao().GetListVideo(ID_Casi);
            //ViewBag.ListVideo_CaSi=new Video_CaSiDao
            return View();
        }
    }
}