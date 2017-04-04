using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.EF
{
    [Table("tbl_Menu")]
    public class tbl_Menu
    {
        [Key]
        public long ID { get; set; }
        [StringLength(50)]
        public string Text { get; set; }
        [StringLength(50)]
        public string Link { get; set; }
        [StringLength(50)]
        public string Target { get; set; }

        public bool? Status { get; set; }
        public int DisplayOrder { get; set; }
    }
}
