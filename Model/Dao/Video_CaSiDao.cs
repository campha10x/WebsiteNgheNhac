using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using Model.ViewModel;
namespace Model.Dao
{
   public class Video_CaSiDao
    {
        WebsiteNgheNhacDbContext db = null;
        public Video_CaSiDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<Video_CaSiModel> GetAll()
        {
            var model = (from a in db.tbl_Video
                        join b in db.tbl_CaSi
                        on a.Id_CaSi equals b.Id
                        where a.Id_CaSi == b.Id
                        && a.Active.Value.Equals(true)
                        orderby a.LuotXem descending
                        select new Video_CaSiModel()
                        {
                            Id = a.Id,
                            Ten_Video = a.Ten_Video,
                            LuotXem = a.LuotXem,
                            Url_Video = a.Url_Video,
                            Active = a.Active,
                            NgayDang = a.NgayDang,
                            urlImage = a.urlImage,
                            NgheDanh = b.NgheDanh

                        }).Take(6);
            return model.ToList();
        }
    }
}
