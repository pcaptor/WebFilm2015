//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebFilm2015.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class History
    {
        public int history_id { get; set; }
        public int film_id { get; set; }
        public int season_id { get; set; }
        public int episode_id { get; set; }
        public System.DateTime hdate { get; set; }
    
        public virtual Episode Episode { get; set; }
        public virtual Film Film { get; set; }
        public virtual Season Season { get; set; }
    }
}