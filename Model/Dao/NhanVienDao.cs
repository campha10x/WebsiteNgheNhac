using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
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
        public tbl_NhanVien GetById(string userName)
        {
            return db.tbl_NhanVien.SingleOrDefault(x=>x.UserName==userName);
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
    }
}
