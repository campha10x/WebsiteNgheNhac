using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.Dao
{
    public class ChuDeDao
    {
         WebsiteNgheNhacDbContext db = null;
        public ChuDeDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<tbl_ChuDe> ListByAll()
        {
            return db.tbl_ChuDe.Where(e => e.Active == true).OrderBy(e => e.Id).ToList();
        }
    
    }
}
