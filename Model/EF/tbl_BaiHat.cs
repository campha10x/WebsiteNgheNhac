namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_BaiHat
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        [Display(Name = "Tên bài hát")]
        public string TenBaiHat { get; set; }
        [Display(Name = "Đường dẫn bài hát")]
        public string url_BaiHat { get; set; }
        [Display(Name = "Đường dẫn ảnh")]
        public string url_Image { get; set; }
        [Display(Name = "Lượt nghe")]
        public int? LuotNghe { get; set; }
        [Display(Name = "Lượt tải")]
        public int? LuotTai { get; set; }
        [Display(Name = "Trạng thái")]
        public bool Active { get; set; }
        [Display(Name = "Tên thể loại")]
        public long? Id_TheLoai { get; set; }
        [Display(Name = "Tên ca sĩ")]
        public long? Id_CaSi { get; set; }
        [Display(Name = "Tên chủ đề")]
        public long? Id_ChuDe { get; set; }
        [Display(Name = "Tên Album")]
        public long? Id_Album { get; set; }

        [ForeignKey("tbl_NhacSi")]
        [Display(Name = "Tên nhạc sĩ")]
        public long? ID_NhacSi { get; set; }

    
        public virtual tbl_NhacSi tbl_NhacSi { get; set; }

        public virtual tbl_Album tbl_Album { get; set; }

        public virtual tbl_CaSi tbl_CaSi { get; set; }

        public virtual tbl_ChuDe tbl_ChuDe { get; set; }

        public virtual tbl_TheLoai tbl_TheLoai { get; set; }

    }
}
