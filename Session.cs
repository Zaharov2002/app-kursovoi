//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace app_kursovoi
{
    using System;
    using System.Collections.Generic;
    
    public partial class Session
    {
        public int id { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<System.TimeSpan> time { get; set; }
        public Nullable<int> HoleCode { get; set; }
        public Nullable<int> FilmCode { get; set; }
    
        public virtual film film { get; set; }
        public virtual Hole Hole { get; set; }
    }
}
