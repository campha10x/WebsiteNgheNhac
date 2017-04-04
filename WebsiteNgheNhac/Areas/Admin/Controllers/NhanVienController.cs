using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EF;
using WebsiteNgheNhac.Common;
using PagedList;
using PagedList.Mvc;
using System.Globalization;

namespace WebsiteNgheNhac.Areas.Admin.Controllers
{
    public class NhanVienController : Controller
    {
        public static List<SelectListItem> listChucvu ;
      
    // GET: Admin/NhanVien
         public ActionResult Index(string searchString,int page=1,int pageSize=1)

        {
          
            var dao = new NhanVienDao();
            var model = dao.ListAllPaging(searchString,page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        public void SetViewBag(long? selectedId=null)
        {
            var dao = new QuyenDao();
            ViewBag.ListQuyen = dao.ListAll();
              listChucvu = new List<SelectListItem>() {         
                new SelectListItem() { Value = "0",Text = "Giám đốc",Selected = true},
                new SelectListItem() { Value = "1",Text = "Trưởng phòng",Selected = false },
                new SelectListItem() { Value = "2",Text = "Nhân viên",Selected = false }
            };

        ViewBag.listChucvu = listChucvu;
            
        }
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var nv = new NhanVienDao().ViewDetail(id);
            SetViewBag(1);
            return View(nv);
        }
        [HttpPost]
        public ActionResult Edit(tbl_NhanVien nv)
        {
            if(ModelState.IsValid)
            {
                var dao = new NhanVienDao();
                var selectedChucvu = listChucvu.FirstOrDefault(x => x.Value == nv.ChucVu);
                string tenChucVu = (selectedChucvu == null ? string.Empty : selectedChucvu.Text);
                if(!string.IsNullOrEmpty(nv.Password))
                {
                    var encrytedMd5Pas = Encryptor.MD5Hash(nv.Password);
                    nv.Password = encrytedMd5Pas.ToString();
                }
                nv.ChucVu = tenChucVu;
                var result = dao.Update(nv);
                if(result)
                {
                    return RedirectToAction("Index","NhanVien");
                }
                else
                {
                    ModelState.AddModelError("","Cập nhật nhân viên thành công!");
                }
            }
            return View();
        }
        [HttpPost]
        public ActionResult Create(tbl_NhanVien nv)
        {
            if(ModelState.IsValid)
            {
                var dao = new NhanVienDao();
                var selectedChucvu = listChucvu.FirstOrDefault(x => x.Value == nv.ChucVu);
                string tenChucVu = (selectedChucvu == null ? string.Empty : selectedChucvu.Text);
                var encrytedMd5Pas = Encryptor.MD5Hash(nv.Password);
                nv.Password = encrytedMd5Pas.ToString();
                nv.ChucVu = tenChucVu;
                long id = dao.Insert(nv);
                if(id>0)
                {
                    return RedirectToAction("Index","NhanVien");
                }
                else
                {
                    ModelState.AddModelError("","Thêm nhân viên thành công!");
                }
            }
            return View();
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new NhanVienDao().Delete(id);
            return RedirectToAction("Index");
        }
        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new NhanVienDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}