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
    
    public partial class YEAR
    {
        public YEAR()
        {
            this.ACADEMICYEARs = new HashSet<ACADEMICYEAR>();
        }
    
        public int ID_YEAR { get; set; }
        public Nullable<int> YEARS_NAME { get; set; }
    
        public virtual ICollection<ACADEMICYEAR> ACADEMICYEARs { get; set; }
    }
}