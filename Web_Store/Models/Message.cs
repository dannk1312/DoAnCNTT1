//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Web_Store.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Message
    {
        public int DiscussId { get; set; }
        public string Username { get; set; }
        public int MessageId { get; set; }
        public string Content { get; set; }
        public Nullable<System.DateTime> Time { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual Discuss Discuss { get; set; }
    }
}
