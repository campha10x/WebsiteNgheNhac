namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_NguoiDung : IDisposable
    {

        [Display(Name = "Tài khoản")]
        [StringLength(50)]
        public string TaiKhoan { get; set; }

        [Display(Name = "Mật khẩu")]
        //[Column("MatKhau", TypeName = "nvarchar")]
        [StringLength(50)]
        public string MatKhau { get; set; }

        [Display(Name = "Mã tài khoản")]
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }

        [Display(Name = "Trạng thái")]
        public bool Active { get; set; }

        //[Column("Facebook", TypeName ="varchar")]
        [Display(Name = "Facebook")]
        [StringLength(500)]
        public string Fb { get; set; }

        [Display(Name = "Google")]
        [StringLength(500)]
        //[Column("Google", TypeName = "varchar")]
        public string Google { get; set; }

        [Display(Name = "Email")]
        //[Column("Email", TypeName = "nvarchar")]

        [StringLength(50)]
        public string Email { get; set; }

        [Display(Name = "Họ tên")]
        [StringLength(500)]
        public string HoTen { get; set; }
        void IDisposable.Dispose()
        {

        }
    }
}
