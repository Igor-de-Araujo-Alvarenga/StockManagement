using System;
using System.Collections.Generic;

namespace StockManagement.Persistence
{
    public partial class TbProduct
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public decimal? Price { get; set; }
        public string? Code { get; set; }
        public int? Quantity { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? CategoryId { get; set; }
        public int? SizeId { get; set; }
        public int? StatusId { get; set; }

        public virtual TbCategory? Category { get; set; }
        public virtual TbSize? Size { get; set; }
        public virtual TbStatus? Status { get; set; }
    }
}
