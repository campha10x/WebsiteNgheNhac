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
using System.Web.Script.Serialization;
using System.Text.RegularExpressions;
using System.Text;

namespace WebsiteNgheNhac.Areas.Admin.Controllers
{
    public class NhanVienController : BaseController
    {
        public static List<SelectListItem> listChucvu ;
        private WebsiteNgheNhacDbContext db ;
        public NhanVienController()
        {
          
            db = new WebsiteNgheNhacDbContext();
        }
        // GET: Admin/NhanVien
        public ActionResult Index()
        {
            
            return View();
        }
        public static string convertToUnSign3(string s)
        {
            Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
            string temp = s.Normalize(NormalizationForm.FormD);
            return regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
        }
        [HttpGet]
        public JsonResult LoadData(string name,string status,int page,int pageSize=2)
        {
            db.Configuration.ProxyCreationEnabled = false;
            IEnumerable<tbl_NhanVien> model = db.tbl_NhanVien;
            if (!string.IsNullOrEmpty(name))
            {
                model = model.Where(x => convertToUnSign3(x.tenNV.ToLower()).Contains(convertToUnSign3(name.ToLower())));
            }
              
            if(!string.IsNullOrEmpty(status))
            {
                var statusBool = bool.Parse(status);
                model = model.Where(x => x.Status == statusBool);
            }
            int totalRow = model.Count(); 
            model = model.OrderBy(x=>x.Id).Skip((page-1)*pageSize).Take(pageSize);
           
            return Json(new
            {
                total = totalRow,
                data = model,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetItems()
        {
            var dropdownitems = db.tbl_Quyen.ToList();
            var items = dropdownitems.Select(s => new SelectListItem { Text = s.TenQuyen, Value = s.Id.ToString() }).AsEnumerable();
            return Json(items, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult SaveData(string strEmployee)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            tbl_NhanVien employee = serializer.Deserialize<tbl_NhanVien>(strEmployee);
            bool status = false;
            string message = string.Empty;
            //add new employee if id = 0
            if (employee.Id == 0)
            {
                db.tbl_NhanVien.Add(employee);
                try
                {
                    db.SaveChanges();
                    status = true;
                }
                catch (Exception ex)
                {
                    status = false;
                    message = ex.Message;
                }
            }
            else
            {
                //update existing DB
                //save db
                var entity = db.tbl_NhanVien.Find(employee.Id);
                entity.tenNV = employee.tenNV;
                entity.NgaySinh = employee.NgaySinh;
                entity.Status = employee.Status;
                entity.gioitinh = employee.gioitinh;
                entity.ChucVu = employee.ChucVu;
                entity.Id_Quyen = employee.Id_Quyen;
                entity.UserName = employee.UserName;
                entity.Password = employee.Password;
                entity.Status = employee.Status;
                entity.Luong = employee.Luong;

                try
                {
                    db.SaveChanges();
                    status = true;
                }
                catch (Exception ex)
                {
                    status = false;
                    message = ex.Message;
                }

            }

            return Json(new
            {
                status = status,
                message = message
            });
        }

        [HttpPost]
        public JsonResult Update(string model)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            tbl_NhanVien nv = serializer.Deserialize<tbl_NhanVien>(model);
            //var entity = new NhanVienDao().GetById(nv.Id);
            var entity = db.tbl_NhanVien.Single(e=>e.Id==nv.Id);
            entity.Luong = nv.Luong;
            db.SaveChanges();
            return Json(new {
                status=true
            });
        }
        [HttpGet]
        public JsonResult GetDetail(long Id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var employee = db.tbl_NhanVien.Find(Id);
            return Json(new
            {
                data = employee,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Delete(int id)
        {
            var entity = db.tbl_NhanVien.Find(id);
            db.tbl_NhanVien.Remove(entity);
            try
            {
                db.SaveChanges();
                return Json(new{
                    status = true 
                });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    status = false,
                    message = ex.Message
                });
            }
        }
    }
}