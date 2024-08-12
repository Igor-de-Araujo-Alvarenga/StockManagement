using System;
using System.Collections.Generic;

namespace StockManagement.Persistence
{
    public partial class TbSize
    {
        public TbSize()
        {
            TbProducts = new HashSet<TbProduct>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;

        public virtual ICollection<TbProduct> TbProducts { get; set; }
    }
}
