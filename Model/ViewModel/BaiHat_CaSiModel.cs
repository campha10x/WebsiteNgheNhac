using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class BaiHat_CaSiModel
    {
        public long Id { get; set; }
        public string TenBaiHat { get; set; }
        public string url_BaiHat { get; set; }
        public int? LuotNghe { get; set; }
        public int? LuotTai { get; set; }
        public bool? Active { get; set; }
        public long? Id_TheLoai { get; set; }
        public long? Id_CaSi { get; set; }
        public long? Id_ChuDe { get; set; }
        public long? Id_Album { get; set; }
        public string NgheDanh { get; set; }
        public string TenThat { get; set; }
        public DateTime? NgaySinh { get; set; }
        public string KhaNang { get; set; }
        public string TrinhDoHocVan { get; set; }
        public string MoTaSuNghiep { get; set; }
        public string urlImage { get; set; }

        public string TenTheLoai { get; set; }
        public string Hoten { get; set; }
    }
}
