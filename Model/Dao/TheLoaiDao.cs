using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.Dao
{
    public class TheLoaiDao
    {
        WebsiteNgheNhacDbContext db = null;
        public TheLoaiDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<tbl_TheLoai> ListByAll()
        {
            return db.tbl_TheLoai.Where(e => e.Active == true).OrderBy(e => e.Id).ToList();
        }
    }
}
