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
        public List<Video_CaSiModel> Get_Ord_1()
        {
            var model = (from a in db.tbl_Video
                        join b in db.tbl_CaSi
                        on a.Id_CaSi equals b.Id
                        where a.Id_CaSi == b.Id
                        && a.Active.Equals(true)
                        && a.Ord==1
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
                            NgheDanh = b.NgheDanh,
                            Ord=a.Ord
                        }).Take(6);
            return model.ToList();
        }

        public List<Video_CaSiModel> Get_Ord_2()
        {
            var model = (from a in db.tbl_Video
                         join b in db.tbl_CaSi
                         on a.Id_CaSi equals b.Id
                         where a.Id_CaSi == b.Id
                         && a.Active.Equals(true)
                         && a.Ord == 2
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
                             NgheDanh = b.NgheDanh,
                             Ord = a.Ord
                         }).Take(6);
            return model.ToList();
        }

        public List<Video_CaSiModel> GetById(long id)
        {
            var model = (from a in db.tbl_Video
                         join b in db.tbl_CaSi
                         on a.Id_CaSi equals b.Id
                         join c in db.tbl_TheLoai
                         on a.Id_TheLoai equals c.Id
                         where a.Id == id
                         && a.Active.Equals(true)
                         select new Video_CaSiModel()
                         {
                             Id = a.Id,
                             Ten_Video = a.Ten_Video,
                             LuotXem = a.LuotXem,
                             Url_Video = a.Url_Video,
                             Active = a.Active,
                             NgayDang = a.NgayDang,
                             urlImage = a.urlImage,
                             NgheDanh = b.NgheDanh,
                             TenTheLoai=c.Ten_TheLoai,
                             ID_Casi=b.Id
                         });
            return model.ToList();
        }
        public List<Video_CaSiModel> GetListVideo(long id)
        {
            var model = (from a in db.tbl_Video
                         join b in db.tbl_CaSi
                         on a.Id_CaSi equals b.Id
                         where a.Id_CaSi == id
                         && a.Active.Equals(true)
                         select new Video_CaSiModel()
                         {
                             Id = a.Id,
                             Ten_Video = a.Ten_Video,
                             LuotXem = a.LuotXem,
                             Url_Video = a.Url_Video,
                             Active = a.Active,
                             NgayDang = a.NgayDang,
                             urlImage = a.urlImage,
                             NgheDanh = b.NgheDanh,
                             ID_Casi = b.Id
                         });
            return model.ToList();
        }
    }
}
