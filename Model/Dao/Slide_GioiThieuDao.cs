using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.Dao
{
    public class Slide_GioiThieuDao
    {
        WebsiteNgheNhacDbContext db = null;
        public Slide_GioiThieuDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<tbl_Slide_GioiThieu> ListByAll()
        {
            return db.tbl_Slide_GioiThieu.Where(e=>e.Active==true).OrderBy(e=>e.id).ToList();
        }
    }
}
