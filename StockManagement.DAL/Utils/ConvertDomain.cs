using StockManagement.Domain;
using StockManagement.Persistence;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockManagement.DAL.Convert
{
    public static class ConvertDomain
    {
        public static ProductDTO ProductToDomain(TbProduct product)
        {
            return new ProductDTO
            (
                product.Id,
                product.Name,
                product.Description,
                product.Price,
                product.Code,
                product.Quantity,
                product.CreatedAt,
                product.UpdatedAt,
                new InformationDTO(product.Category.Id, product.Category.Name),
                new InformationDTO(product.Size.Id, product.Size.Name),
                new InformationDTO(product.Status.Id, product.Status.Name)
            );
        }

        public static TbProduct ProductToPersistence(ProductDTO product)
        {
            return new TbProduct
            {
                Id = product.Id,
                Name = product.Name,
                Description = product.Description,
                Price = product.Price,
                Code = product.Code,
                Quantity = product.Quantity,
                CategoryId = product.Category?.Id,
                SizeId = product.Size?.Id,
                StatusId = product.Status?.Id
            };
        }
    }
}
