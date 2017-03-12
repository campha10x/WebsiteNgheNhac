using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.Dao
{
    public class QuyenDao
    {
        WebsiteNgheNhacDbContext db = null;
        public QuyenDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<tbl_Quyen> ListAll()
        {
            return db.tbl_Quyen.ToList();
        }
    }
}
