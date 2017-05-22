using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
   public class CaSiDao
    {
        WebsiteNgheNhacDbContext db = null;
        public CaSiDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<tbl_CaSi> ListByAll()
        {
            return db.tbl_CaSi.Where(e => e.Active == true).OrderBy(e => e.Id).ToList();
        }
    }
}
