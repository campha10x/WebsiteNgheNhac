using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
using System.Globalization;

namespace Model.Dao
{
   public class TinTucDao
    {
        WebsiteNgheNhacDbContext db = null;
        public TinTucDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<tbl_TinTuc> GetByTop(int top)
        {
            return db.tbl_TinTuc.Where(e => e.Active == true).Take(top).OrderByDescending(e => e.Id).ToList();
        }
        public List<tbl_TinTuc> GetByListTinTucx(int Id,int top)
        {
            return db.tbl_TinTuc.Where(e => e.Active == true && e.Id!=Id).Take(top).OrderByDescending(e => e.Id).ToList();
        }
        public List<tbl_TinTuc> GetByTintuc(int Id)
        {
            List<tbl_TinTuc> lst = new List<tbl_TinTuc>();
            lst = db.tbl_TinTuc.Where(e => e.Id == Id).ToList();
            return lst;
        }
        //Admin
        public IEnumerable<tbl_TinTuc> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<tbl_TinTuc> model = db.tbl_TinTuc;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TieuDe.Contains(searchString) );
            }
            return model.OrderBy(x => x.Id).ToPagedList(page, pageSize);
        }
        public bool ChangeStatus(long id)
        {
            var nv = db.tbl_TinTuc.Find(id);
            nv.Active = !nv.Active;
            db.SaveChanges();
            return nv.Active;
        }
        public bool Update(tbl_TinTuc entity)
        {
            try
            {
                var obj = db.tbl_TinTuc.Find(entity.Id);
                obj.TieuDe = entity.TieuDe;
                obj.TomTat = entity.TomTat;
                obj.NoiDung = entity.NoiDung;
                obj.ngayviet = entity.ngayviet;
                obj.id_nhanvien = entity.id_nhanvien;
                obj.urlHinhAnh = entity.urlHinhAnh;
                obj.Active = entity.Active;
                obj.Url_BaiHat = entity.Url_BaiHat;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {

                return false;
            }
        }
        public long Insert(tbl_TinTuc entity)
        {
            db.tbl_TinTuc.Add(entity);
            db.SaveChanges();
            return entity.Id;
        }
        public tbl_TinTuc ViewDetail(int id)
        {
            return db.tbl_TinTuc.Find(id);
        }
        public bool Delete(int id)
        {
            try
            {
                var obj = db.tbl_TinTuc.Find(id);
                db.tbl_TinTuc.Remove(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }

    }
}
