namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_QuangCao
    {
        public long Id { get; set; }

        [StringLength(50)]
        public string UrlImage { get; set; }

        public bool? Active { get; set; }

        public int? Count_Click { get; set; }
    }
}
