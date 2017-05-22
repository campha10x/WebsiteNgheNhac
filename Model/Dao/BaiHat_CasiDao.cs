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
                         && a.Active.Equals(true)
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
        public List<BaiHat_CaSiModel> GetById(long id)
        {
            var objectBH = (from a in db.tbl_BaiHat
                            join b in db.tbl_CaSi on a.Id_CaSi equals b.Id
                            join c in db.tbl_NhacSi on a.ID_NhacSi equals c.Id
                            join d in db.tbl_ChuDe on a.Id_ChuDe equals d.Id
                            join e in db.tbl_TheLoai on a.Id_TheLoai equals e.Id
                          // where a.Id_CaSi == b.Id
                          //&& 
                           where a.Active.Equals(true) && a.Id == id
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
                                urlImage = a.url_Image,
                                 TenTheLoai =e.Ten_TheLoai,
                                 Hoten=c.Hoten
                            }).ToList();
            return objectBH.ToList();
        }

        public string convertToUnSign2(string s)
        {
            string stFormD = s.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();
            for (int ich = 0; ich < stFormD.Length; ich++)
            {
                System.Globalization.UnicodeCategory uc = System.Globalization.CharUnicodeInfo.GetUnicodeCategory(stFormD[ich]);
                if (uc != System.Globalization.UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(stFormD[ich]);
                }
            }
            sb = sb.Replace('Đ', 'D');
            sb = sb.Replace('đ', 'd');
            return (sb.ToString().Normalize(NormalizationForm.FormD));
        }

        public List<BaiHat_CaSiModel> GetByName(string Name_BaiHat)
        {
            string strSearch = convertToUnSign2(Name_BaiHat.ToLower());
            var objectBH = (from a in db.tbl_BaiHat
                            join b in db.tbl_CaSi on a.Id_CaSi equals b.Id
                            join c in db.tbl_NhacSi on a.ID_NhacSi equals c.Id
                            join d in db.tbl_ChuDe on a.Id_ChuDe equals d.Id
                            join e in db.tbl_TheLoai on a.Id_TheLoai equals e.Id
                            where a.Active.Equals(true)  
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
                                urlImage = a.url_Image,
                                TenTheLoai = e.Ten_TheLoai,
                                Hoten = c.Hoten
                            }).Take(10).ToList();
            List<BaiHat_CaSiModel> result = objectBH.FindAll(

            delegate (BaiHat_CaSiModel math)

            {

                if (convertToUnSign2(math.TenBaiHat.ToLower()).Contains(strSearch))

                    return true;

                else

                    return false;

            }

        );
            return result;
        }
        //public BaiHat_CaSiModel ViewDetail(long id)
        //{
        //    return db.
        //}
    }
}
