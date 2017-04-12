namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_NguoiDung:IDisposable
    {
        [Display(Name ="Tài khoản")]
        [Required(ErrorMessage ="{0} không được bỏ trống")]
        [StringLength(50)]
        public string TaiKhoan { get; set; }
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "{0} không được bỏ trống")]
        [StringLength(50)]
        public string MatKhau { get; set; }
        [Display(Name = "Mã tài khoản")]
        [Required(ErrorMessage = "{0} không được bỏ trống")]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long Id { get; set; }
        [Display(Name = "Trạng thái")]
        [Required(ErrorMessage = "{0} không được bỏ trống")]
        public bool? Active { get; set; }
        [Display(Name = "Facebook")]
        [Required(ErrorMessage = "{0} không được bỏ trống")]
        public string Fb { get; set; }
         [Display(Name ="Google")]
        [Required(ErrorMessage = "{0} không được bỏ trống")]
        [Column("Google+")]
        public string Google_ { get; set; }
        [Display(Name = "Email")]
        [Required(ErrorMessage = "{0} không được bỏ trống")]
        [StringLength(50)]
        public string Email { get; set; }
        void IDisposable.Dispose()
        {

        }
    }
}
