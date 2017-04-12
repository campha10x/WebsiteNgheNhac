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
    }
}
