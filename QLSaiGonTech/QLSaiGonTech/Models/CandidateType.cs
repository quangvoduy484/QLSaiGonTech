using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace QLSaiGonTech.Models
{
    public class CandidateType
    {
        [Display(Name="ID Canididate")]
        public string ID_CANDIDATE { get; set; }
        [Display(Name = "Name Canididate")]
        public string CANDIDATENAME { get; set; }
    }
}