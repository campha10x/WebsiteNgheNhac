using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class Video_CaSiModel
    {
        public long Id { get; set; }
        public string Ten_Video { get; set; }
        public int? LuotXem { get; set; }
        public string Url_Video { get; set; }
        public bool? Active { get; set; }
        public DateTime? NgayDang { get; set; }
        public string urlImage { get; set; }
        public string NgheDanh { get; set; }
    }
}
