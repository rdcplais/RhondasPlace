//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RhondasPlaceSite.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CandleType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CandleType()
        {
            this.Candles = new HashSet<Candle>();
        }
    
        public int CandleTypeID { get; set; }
        public string CandleDescription { get; set; }
        public System.DateTime AddDateTime { get; set; }
        public string AddUserName { get; set; }
        public System.DateTime LastUpdateTime { get; set; }
        public string LastUpdateUserName { get; set; }
        public string CandleType1 { get; set; }
        public bool IsDeleted { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Candle> Candles { get; set; }
    }
}
