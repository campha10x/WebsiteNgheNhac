using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
namespace Model.Dao
{
    public class BaiHatDao
    {
          WebsiteNgheNhacDbContext db = null;
        public BaiHatDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public void Update_LuotNghe(long id)
        {
            tbl_BaiHat obj = new tbl_BaiHat();
            obj = db.tbl_BaiHat.SingleOrDefault(e => e.Id == id);
            if(obj.LuotNghe==null)
            {
                obj.LuotNghe = 1;
            }
            else
            obj.LuotNghe = obj.LuotNghe + 1;
             db.SaveChanges();
        }
        public List<string> ListName(string keyword)
        {
            return db.tbl_BaiHat.Where(x => x.TenBaiHat.Contains(keyword)).Select(x => x.TenBaiHat).ToList();
        }

        //Admin
        public IEnumerable<tbl_BaiHat> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<tbl_BaiHat> model = db.tbl_BaiHat;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenBaiHat.Contains(searchString));
            }
            return model.OrderBy(x => x.Id).ToPagedList(page, pageSize);
        }
        public long Insert(tbl_BaiHat entity)
        {
            db.tbl_BaiHat.Add(entity);
            db.SaveChanges();
            return entity.Id;
        }
        public tbl_BaiHat ViewDetail(int id)
        {
            return db.tbl_BaiHat.Find(id);
        }
        public bool Update(tbl_BaiHat entity)
        {
            try
            {
                var obj = db.tbl_BaiHat.Find(entity.Id);
                obj.TenBaiHat = entity.TenBaiHat;
                obj.url_BaiHat = entity.url_BaiHat;
                obj.url_Image = entity.url_Image;
                obj.LuotNghe = entity.LuotNghe;
                obj.LuotTai = entity.LuotTai;
                obj.Active = entity.Active;
                obj.Id_TheLoai = entity.Id_TheLoai;
                obj.Id_CaSi = entity.Id_CaSi;
                obj.Id_ChuDe = entity.Id_ChuDe;
                obj.Id_Album = entity.Id_Album;
                obj.ID_NhacSi = entity.ID_NhacSi;
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
            var nv = db.tbl_BaiHat.Find(id);
            nv.Active = !nv.Active;
            db.SaveChanges();
            return nv.Active;
        }
        public bool Delete(int id)
        {
            try
            {
                var obj = db.tbl_BaiHat.Find(id);
                db.tbl_BaiHat.Remove(obj);
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
