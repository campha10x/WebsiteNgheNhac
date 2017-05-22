using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
   public class NhacSiDao
    {
        WebsiteNgheNhacDbContext db = null;
        public NhacSiDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<tbl_NhacSi> ListByAll()
        {
            return db.tbl_NhacSi.Where(e => e.Active == true).OrderBy(e => e.Id).ToList();
        }
    }
}
