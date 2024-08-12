using StockManagement.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockManagement.DAL.Interfaces
{
    public interface IProductDAL
    {
        List<ProductDTO> GetAll();
        ProductDTO Get(int id);
        int Post(ProductDTO product);
    }
}
