using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.Dao
{
    public class AlbumDao
    {
        WebsiteNgheNhacDbContext db = null;
        public AlbumDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<tbl_Album> ListByAll()
        {
            return db.tbl_Album.Where(e => e.Active == true).OrderBy(e => e.Id).ToList();
        }
    }
}
