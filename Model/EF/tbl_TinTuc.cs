namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_TinTuc
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        [Display(Name = "Tiêu đề")]
        public string TieuDe { get; set; }
        [Display(Name = "Tóm tắt")]
        public string TomTat { get; set; }
        [Display(Name = "Nội dung")]
        public string NoiDung { get; set; }
        [Display(Name = "Ngày viết")]
        [Required, Column(TypeName = "Date"), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime ngayviet { get; set; }
        [Display(Name = "ID_Nhân viên")]
        public long? id_nhanvien { get; set; }
        [Display(Name = "Đường dẫn hình ảnh")]
        public string urlHinhAnh { get; set; }
        [Display(Name = "Lượt xem")]
        public int? LuotXem { get; set; }
        [Display(Name = "Trạng thái")]
        public bool Active { get; set; }
        [Display(Name = "Đường dẫn bài hát")]
        public string Url_BaiHat { get; set; }
        public virtual tbl_NhanVien tbl_NhanVien { get; set; }

    }
}
