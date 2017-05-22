using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.Dao
{
    public class NguoiDungDao
    {
        WebsiteNgheNhacDbContext db = null;
        public NguoiDungDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public bool Check_DangNhap(tbl_NguoiDung user)
        {
            tbl_NguoiDung kh = db.tbl_NguoiDung.SingleOrDefault(n => n.TaiKhoan == user.TaiKhoan && n.MatKhau == user.MatKhau);
            if (kh != null)
                return true;
            else
                return false;
        }
        public long InsertForFacebook(tbl_NguoiDung entity)
        {
           
            var user = db.tbl_NguoiDung.SingleOrDefault(x => x.TaiKhoan == entity.TaiKhoan);
            if(user==null)
            {
                db.tbl_NguoiDung.Add(entity);
                db.SaveChanges();
                return entity.Id;
            }
            else
            {
                return user.Id;
            }
        }
        public long Insert(tbl_NguoiDung entity)
        {
            db.tbl_NguoiDung.Add(entity);
            db.SaveChanges();
            return entity.Id;
        }
        public bool CheckUserName(string username)
        {
            return db.tbl_NguoiDung.Count(x => x.TaiKhoan == username)>0;
        }
        public bool CheckEmail(string email)
        {
            return db.tbl_NguoiDung.Count(x => x.Email == email) > 0;
        }
        //public long Get_MaxId()
        //{
        //    long id = db.tbl_NguoiDung.Max(t => t.Id);
        //    if (id > 0)
        //        return 1;
        //    else
        //    return id+1;
        //}
    }
}
