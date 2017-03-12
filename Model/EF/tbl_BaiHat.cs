namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_BaiHat
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
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

        public virtual tbl_Album tbl_Album { get; set; }

        public virtual tbl_CaSi tbl_CaSi { get; set; }

        public virtual tbl_ChuDe tbl_ChuDe { get; set; }

        public virtual tbl_TheLoai tbl_TheLoai { get; set; }
    }
}
