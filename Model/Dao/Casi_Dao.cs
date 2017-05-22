using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.Dao
{
    public class Casi_Dao
    {
        WebsiteNgheNhacDbContext db = null;
        public Casi_Dao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
    }
}
