namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_Video
    {

        public long Id { get; set; }

        [StringLength(50)]
        public string Ten_Video { get; set; }

        public long? Id_CaSi { get; set; }

        public int? LuotXem { get; set; }

        public long? Id_TheLoai { get; set; }

        [StringLength(50)]
        public string Url_Video { get; set; }

        public bool? Active { get; set; }

        public long? Id_ChuDe { get; set; }

        public long? Id_NhanVien { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayDang { get; set; }

        [StringLength(200)]
        public string urlImage { get; set; }

        public virtual tbl_CaSi tbl_CaSi { get; set; }

        public virtual tbl_ChuDe tbl_ChuDe { get; set; }

        public virtual tbl_NhanVien tbl_NhanVien { get; set; }

        public virtual tbl_TheLoai tbl_TheLoai { get; set; }
    }
}
