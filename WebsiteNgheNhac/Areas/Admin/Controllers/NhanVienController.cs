using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using WebsiteNgheNhac.Common;
namespace WebsiteNgheNhac.Areas.Admin.Controllers
{
    public class NhanVienController : Controller
    {
        // GET: Admin/NhanVien
        public ActionResult Index()
        {
            //WebsiteNgheNhacDbContext obj = new WebsiteNgheNhacDbContext();
            //var getQuyen = obj.tbl_Quyen.ToList();
            //SelectList list = new SelectList(getQuyen,"Id", "TenQuyen");
            //ViewBag.TenQuyen = list;
            return View();
        }
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }
       [HttpPost]
        public ActionResult Create(tbl_NhanVien nv)
        {
            if(ModelState.IsValid)
            {
                var dao = new NhanVienDao();
                var encryptor = Encryptor.MD5Hash(nv.Password);
                nv.Password = encryptor;
                long id = dao.Insert(nv);
                if(id>0)
                {
                    return RedirectToAction("Index","NhanVien");
                }
                else
                {
                    ModelState.AddModelError("","Thêm nhân viên thành công!!");
                }
            }
            return View("Index");
        }
        public void SetViewBag(long? selectedId=null)
        {
            var dao = new QuyenDao();
            ViewBag.Id_Quyen = new SelectList(dao.ListAll(), "Id", "TenQuyen", selectedId);
        }
    }
}