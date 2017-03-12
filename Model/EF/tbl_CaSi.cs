namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_CaSi
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_CaSi()
        {
            tbl_BaiHat = new HashSet<tbl_BaiHat>();
            tbl_Video = new HashSet<tbl_Video>();
        }

        public long Id { get; set; }

        public string NgheDanh { get; set; }

        public string TenThat { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgaySinh { get; set; }

        public string KhaNang { get; set; }

        public string TrinhDoHocVan { get; set; }

        [StringLength(10)]
        public string MoTaSuNghiep { get; set; }

        public string urlImage { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_BaiHat> tbl_BaiHat { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Video> tbl_Video { get; set; }
    }
}
