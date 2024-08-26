using Microsoft.EntityFrameworkCore;
using StockManagement.DAL.Convert;
using StockManagement.DAL.Interfaces;
using StockManagement.Domain;
using StockManagement.Persistence;

namespace StockManagement.DAL
{
    public class ProductDAL : IProductDAL
    {
        private readonly stockContext Context;
        public ProductDAL(stockContext context)
        {
            Context = context;
        }
        public ProductDTO Get(int id)
        {
            return Context.TbProducts
                .Include(p => p.Status)
                .Include(p => p.Category)
                .Include(p => p.Size)
                .Where(p => p.Id == id)
                .Select(p => ConvertDomain.ProductToDomain(p))
                .AsNoTracking().FirstOrDefault();
        }

        public List<ProductDTO> GetAll()
        {
            return Context.TbProducts
                .Include(p => p.Status)
                .Include(p => p.Category)
                .Include(p => p.Size)
                .Select(p => ConvertDomain.ProductToDomain(p)).ToList();
        }

        public int Post(ProductDTO product)
        {
            var newProduct = ConvertDomain.ProductToPersistence(product);
            newProduct.CreatedAt = DateTime.Now;
            Context.TbProducts.Add(newProduct);
            Context.SaveChanges();
            return newProduct.Id;
        }

        public int Update(ProductDTO product)
        {
            var updateProduct = ConvertDomain.ProductToPersistence(product);
            updateProduct.UpdatedAt = DateTime.Now;
            Context.TbProducts.Update(updateProduct);
            Context.SaveChanges();
            return updateProduct.Id;
        }

        public void Delete(int id)
        {
            var product = Context.TbProducts.Where(p => p.Id == id).FirstOrDefault();
            Context.TbProducts.Remove(product);
            Context.SaveChanges();
        }
    }
}