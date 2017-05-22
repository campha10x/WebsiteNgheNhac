using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.Dao
{
    public class VideoDao
    {
        WebsiteNgheNhacDbContext db = null;
        public VideoDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<tbl_Video> GetByTop(int top)
        {
            return db.tbl_Video.Where(e => e.Active == true).Take(top).ToList();
        }
        //Admin
        public IEnumerable<tbl_Video> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<tbl_Video> model = db.tbl_Video;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Ten_Video.Contains(searchString));
            }
            return model.OrderBy(x => x.Id).ToPagedList(page, pageSize);
        }
        public long Insert(tbl_Video entity)
        {
            db.tbl_Video.Add(entity);
            db.SaveChanges();
            return entity.Id;
        }
        public tbl_Video ViewDetail(int id)
        {
            return db.tbl_Video.Find(id);
        }
        public bool Update(tbl_Video entity)
        {
            try
            {
                var obj = db.tbl_Video.Find(entity.Id);
                obj.Ten_Video = entity.Ten_Video;
                obj.Id_CaSi = entity.Id_CaSi;
                obj.LuotXem = entity.LuotXem;
                obj.Id_TheLoai = entity.Id_TheLoai;
                obj.Url_Video = entity.Url_Video;
                obj.Active = entity.Active;
                obj.Id_ChuDe = entity.Id_ChuDe;
                obj.Id_NhanVien = entity.Id_NhanVien;
                obj.NgayDang = entity.NgayDang;
                obj.urlImage = entity.urlImage;
                obj.Ord = entity.Ord;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {

                return false;
            }
        }
        public bool ChangeStatus(long id)
        {
            var nv = db.tbl_Video.Find(id);
            nv.Active = !nv.Active;
            db.SaveChanges();
            return nv.Active;
        }
        public bool Delete(int id)
        {
            try
            {
                var obj = db.tbl_Video.Find(id);
                db.tbl_Video.Remove(obj);
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
