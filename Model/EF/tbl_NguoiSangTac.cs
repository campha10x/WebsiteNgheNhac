using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.EF
{

   public class tbl_NhacSi
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public long Id { get; set; }

        [StringLength(500)]
        public string Hoten { get; set; }

        public DateTime NgaySinh { get; set; }

        [StringLength(500)]
        public string QueQuan { get; set; }
        [StringLength(500)]
        public string HoatDong { get; set; }

        public bool? Active { get; set; }
        public virtual ICollection<tbl_BaiHat> tbl_BaiHat { get; set; }
    }
}
