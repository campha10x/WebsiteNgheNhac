namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_NhanVien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_NhanVien()
        {
            tbl_TinTuc = new HashSet<tbl_TinTuc>();
            tbl_Video = new HashSet<tbl_Video>();
        }

        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }

        [StringLength(50)]
        [Display(Name ="Tên nhân viên")]
        public string tenNV { get; set; }

        [Column(TypeName = "date")]
        [Display(Name ="Ngày sinh")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/mm/yyyy}")]
        public DateTime? NgaySinh { get; set; }

        [StringLength(50)]
        [Display(Name="Giới tính")]
        public string gioitinh { get; set; }

        [StringLength(50)]
        [Display(Name ="Chức vụ")]
        public string ChucVu { get; set; }

        [Display(Name ="Quyền")]
        public long? Id_Quyen { get; set; }

        [StringLength(50)]
        [Display(Name ="Tên đăng nhập")]
        public string UserName { get; set; }

        [StringLength(50)]
        [Display(Name ="Mật khẩu")]
        public string Password { get; set; }
        [Display(Name ="Trạng thái")]
        public bool Status { get; set; }
        public virtual tbl_Quyen tbl_Quyen { get; set; }

        [DataType("decimal(18,0")]
        public decimal Luong { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_TinTuc> tbl_TinTuc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Video> tbl_Video { get; set; }
    }
}
