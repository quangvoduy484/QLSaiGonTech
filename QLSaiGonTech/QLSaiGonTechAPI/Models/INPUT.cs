//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLSaiGonTechAPI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class INPUT
    {
        public INPUT()
        {
            this.PROFILETYPEs = new HashSet<PROFILETYPE>();
        }
    
        public int ID_INPUT { get; set; }
        public string INPUTNAME { get; set; }
    
        public virtual ICollection<PROFILETYPE> PROFILETYPEs { get; set; }
    }
}
