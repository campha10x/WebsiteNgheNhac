namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_TinTuc
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long Id { get; set; }

        public string TieuDe { get; set; }

        public string TomTat { get; set; }

        public string NoiDung { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ngayviet { get; set; }

        public long? id_nhanvien { get; set; }

        public string urlHinhAnh { get; set; }

        public int? LuotXem { get; set; }

        public bool? Active { get; set; }

        public virtual tbl_NhanVien tbl_NhanVien { get; set; }
    }
}
