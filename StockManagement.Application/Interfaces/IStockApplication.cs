using StockManagement.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockManagement.Application.Interfaces
{
    public interface IStockApplication
    {
        DefaultDTO<List<ProductDTO>> Get(int id);
        DefaultDTO<int> Post(ProductDTO product);
    }
}
