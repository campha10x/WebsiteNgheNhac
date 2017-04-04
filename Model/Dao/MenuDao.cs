using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.Dao
{
    public class MenuDao
    {
        WebsiteNgheNhacDbContext db = null;
        public MenuDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<tbl_Menu> ListByAll()
        {
            return db.tbl_Menu.Where(e=>e.Status==true).OrderBy(e=>e.DisplayOrder).ToList();
        }
    }
}
