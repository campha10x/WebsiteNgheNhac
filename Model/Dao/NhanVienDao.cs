using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
namespace Model.Dao
{
    public class NhanVienDao
    {
        WebsiteNgheNhacDbContext db = null;
        public NhanVienDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public long Insert(tbl_NhanVien entity)
        {
            db.tbl_NhanVien.Add(entity);
            db.SaveChanges();
            return entity.Id;
        }
        public bool Update(tbl_NhanVien entity)
        {
            try
            {
                var nv = db.tbl_NhanVien.Find(entity.Id);
                nv.ChucVu = entity.ChucVu;
                nv.gioitinh = entity.gioitinh;
                nv.Id_Quyen = entity.Id_Quyen;
                nv.NgaySinh = entity.NgaySinh;
                if(!string.IsNullOrEmpty(entity.Password))
                    nv.Password = entity.Password;
                nv.Status = entity.Status;
                nv.tenNV = entity.tenNV;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {

                return false;
            }
          
        }
        public IEnumerable<tbl_NhanVien>ListAllPaging(string searchString,int page,int pageSize)
        {
            IQueryable<tbl_NhanVien> model = db.tbl_NhanVien;
            if(!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString)||x.tenNV.Contains(searchString));
            }
            return model.OrderBy(x => x.Id).ToPagedList(page,pageSize);
        }
        public tbl_NhanVien GetById(string userName)
        {
            return db.tbl_NhanVien.SingleOrDefault(x=>x.UserName==userName);
        }
        public tbl_NhanVien ViewDetail(int id)
        {
            return db.tbl_NhanVien.Find(id);
        }
        public int Login(string userName,string passWord)
        {
            var result = db.tbl_NhanVien.SingleOrDefault(x=>x.UserName==userName );
            if (result ==null)
                return 0;
            else
            {
                if(result.Status==false)
                {
                    return -1;
                }
                else
                {
                    if (result.Password == passWord)
                        return 1;
                    else
                        return -2;
                }
            }
        }
        public bool ChangeStatus(long id)
        {
            var nv = db.tbl_NhanVien.Find(id);
            nv.Status = !nv.Status;
            db.SaveChanges();
            return nv.Status;
        }
        public bool Delete(int id)
        {
            try
            {
                var nv = db.tbl_NhanVien.Find(id);
                db.tbl_NhanVien.Remove(nv);
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
