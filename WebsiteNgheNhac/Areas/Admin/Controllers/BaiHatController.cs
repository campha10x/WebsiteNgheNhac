using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EF;
using CKSource.FileSystem;

namespace WebsiteNgheNhac.Areas.Admin.Controllers
{
    public class BaiHatController : BaseController
    {
        // GET: Admin/BaiHat
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new BaiHatDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.TheLoai = new TheLoaiDao().ListByAll();
            ViewBag.CaSi = new CaSiDao().ListByAll();
            ViewBag.ChuDe = new ChuDeDao().ListByAll();
            ViewBag.Album = new AlbumDao().ListByAll();
            ViewBag.NhacSi = new NhacSiDao().ListByAll();
            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Create(tbl_BaiHat obj)
        {
            if (!ModelState.IsValid)
            {
                obj.LuotNghe = 0;
                obj.LuotTai = 0;
                var path = (string)null;
                var dao = new BaiHatDao();
                if (Request.Files.Count > 0)
                {
                    var file = Request.Files[0];
                    if (file != null && file.ContentLength > 0)
                    {
                        var fileName = Path.GetFileName(file.FileName);
                        path = Path.Combine(Server.MapPath("~/asset/client/Audio_Video/Audio/BaiHat"), fileName);
                        file.SaveAs(path);
                    }
                }
                obj.url_BaiHat = path;
                long id = dao.Insert(obj);
                if (id > 0)
                {
                    return RedirectToAction("Index", "TinTuc");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm nhân viên thành công!");
                }
            }
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {

            ViewBag.TheLoai = new TheLoaiDao().ListByAll();
            ViewBag.CaSi = new CaSiDao().ListByAll();
            ViewBag.ChuDe = new ChuDeDao().ListByAll();
            ViewBag.Album = new AlbumDao().ListByAll();
            ViewBag.NhacSi = new NhacSiDao().ListByAll();
            var nv = new BaiHatDao().ViewDetail(id);
            return View(nv);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(tbl_BaiHat nv)
        {
            if (ModelState.IsValid)
            {
                var path = (string)null;
                if (Request.Files.Count > 0)
                {
                    var file = Request.Files[0];
                    if (file != null && file.ContentLength > 0)
                    {
                        var fileName = Path.GetFileName(file.FileName);
                        path = Path.Combine(Server.MapPath("~/asset/client/Audio_Video/Audio/TinTuc"), fileName);
                        file.SaveAs(path);
                        nv.url_BaiHat = path;
                    }
                }
                var dao = new BaiHatDao();
                var result = dao.Update(nv);
                if (result)
                {
                    return RedirectToAction("Index", "BaiHat");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật nhân viên thành công!");
                }
            }
            return View();
        }
        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new BaiHatDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new BaiHatDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}