using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using Model.ViewModel;
namespace Model.Dao
{
    public class BaiHat_CasiDao
    {
        WebsiteNgheNhacDbContext db = null;
        public BaiHat_CasiDao()
        {
            db = new WebsiteNgheNhacDbContext();
        }
        public List<BaiHat_CaSiModel> GetBytop(int top)
        {
            var model = (from a in db.tbl_BaiHat
                         join b in db.tbl_CaSi
                         on a.Id_CaSi equals b.Id
                         where a.Id_CaSi == b.Id
                         && a.Active.Value.Equals(true)
                         orderby a.LuotNghe descending
                         select new BaiHat_CaSiModel
                         {
                             Id = a.Id,
                             TenBaiHat = a.TenBaiHat,
                             url_BaiHat = a.url_BaiHat,
                             LuotNghe = a.LuotNghe,
                             LuotTai = a.LuotTai,
                             Active = a.Active,
                             Id_Album = a.Id_Album,
                             Id_TheLoai = a.Id_TheLoai,
                             Id_CaSi = a.Id_CaSi,
                             Id_ChuDe = a.Id_ChuDe,
                             NgheDanh = b.NgheDanh,
                             TenThat = b.TenThat,
                             NgaySinh = b.NgaySinh,
                             KhaNang = b.KhaNang,
                             TrinhDoHocVan = b.TrinhDoHocVan,
                             MoTaSuNghiep = b.MoTaSuNghiep,
                             urlImage = a.url_Image
                         }).Take(top);
            return model.ToList();
        }
        //public BaiHat_CaSiModel ViewDetail(long id)
        //{
        //    return db.
        //}
    }
}
