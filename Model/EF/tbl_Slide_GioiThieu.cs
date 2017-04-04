namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_Slide_GioiThieu
    {
        public long id { get; set; }

        [StringLength(200)]
        public string urlImage { get; set; }

        public bool? Active { get; set; }

        public int? Count_Click { get; set; }

        [StringLength(200)]
        public string UrlNhac { get; set; }
        [StringLength(200)]
        public string Title { get; set; }
    }
}
