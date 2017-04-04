using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.Dao
{
    public class VideoDao
    {
        WebsiteNgheNhacDbContext db = null;
        public VideoDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<tbl_Video> GetByTop(int top)
        {
            return db.tbl_Video.Where(e => e.Active == true).Take(top).ToList();
        }
    }
}
