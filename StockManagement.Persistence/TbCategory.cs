using System;
using System.Collections.Generic;

namespace StockManagement.Persistence
{
    public partial class TbCategory
    {
        public TbCategory()
        {
            TbProducts = new HashSet<TbProduct>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;

        public virtual ICollection<TbProduct> TbProducts { get; set; }
    }
}
