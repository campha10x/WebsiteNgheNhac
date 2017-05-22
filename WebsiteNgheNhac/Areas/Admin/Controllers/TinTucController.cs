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
    public class TinTucController : BaseController
    {

        // GET: Admin/TinTuc
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new TinTucDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        private bool isValidContentType(string contentType)
        {
            return contentType.Equals("audio/mp3");
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost,ValidateInput(false)]
        public ActionResult Create(tbl_TinTuc obj,string txtId)
        {
            if (ModelState.IsValid)
            {
                obj.LuotXem = 0;
                var path=(string)null;
                obj.id_nhanvien =Convert.ToInt64(txtId);
                var dao = new TinTucDao();
                if (Request.Files.Count > 0)
                {
                    var file = Request.Files[0];
                    if (file != null && file.ContentLength > 0)
                    {
                        var fileName = Path.GetFileName(file.FileName);
                        path = Path.Combine(Server.MapPath("~/asset/client/Audio_Video/Audio/TinTuc"), fileName);
                        file.SaveAs(path);
                    }
                }
                obj.Url_BaiHat = path;
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
            var nv = new TinTucDao().ViewDetail(id);
            return View(nv);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(tbl_TinTuc nv, string txtId)
        {
            if (ModelState.IsValid)
            {
                var path = (string)null;
                nv.id_nhanvien = Convert.ToInt64(txtId);
                if (Request.Files.Count > 0)
                {
                    var file = Request.Files[0];
                    if (file != null && file.ContentLength > 0)
                    {
                        var fileName = Path.GetFileName(file.FileName);
                        path = Path.Combine(Server.MapPath("~/asset/client/Audio_Video/Audio/TinTuc"), fileName);
                        file.SaveAs(path);
                        nv.Url_BaiHat = path;
                    }
                }
                var dao = new TinTucDao();
                var result = dao.Update(nv);
                if (result)
                {
                    return RedirectToAction("Index", "TinTuc");
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
            var result = new TinTucDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new TinTucDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}