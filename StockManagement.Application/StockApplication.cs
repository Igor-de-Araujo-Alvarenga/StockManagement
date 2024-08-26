using StockManagement.Application.Interfaces;
using StockManagement.DAL.Interfaces;
using StockManagement.Domain;

namespace StockManagement.Application
{
    public class StockApplication : IStockApplication
    {
        private readonly IProductDAL ProductDAL;
        public StockApplication(IProductDAL productDAL)
        {
            ProductDAL = productDAL;
        }

        public DefaultDTO<List<ProductDTO>> Get(int id)
        {
            try
            {
                var products = new List<ProductDTO>();
                if (id <= 0)
                    products.AddRange(ProductDAL.GetAll());
                else
                    products.Add(ProductDAL.Get(id));
                return new DefaultDTO<List<ProductDTO>>(products);
            }
            catch(Exception ex)
            {
                return new DefaultDTO<List<ProductDTO>>(null, ex.Message);
            }
        }

        public DefaultDTO<int> Post(ProductDTO input)
        {
            try
            {
                return new DefaultDTO<int>(ProductDAL.Post(input));
            }
            catch (Exception ex)
            {
                return new DefaultDTO<int>(0, ex.Message);
            }
        }

        public DefaultDTO<int> Update(ProductDTO input)
        {
            try
            {
                if (ProductDAL.Get(input.Id) == null)
                    throw new Exception($"Not found product: {input.Id}");
                ProductDAL.Update(input);
                return new DefaultDTO<int>(input.Id);
            }catch(Exception ex)
            {
                return new DefaultDTO<int>(0, ex.Message);
            }
        }

        public DefaultDTO<int> Delete(int id)
        {
            try
            {
                if (ProductDAL.Get(id) == null)
                    throw new Exception($"Not found product: {id}");
                ProductDAL.Delete(id);
                return new DefaultDTO<int>(id);
            }
            catch (Exception ex)
            {
                return new DefaultDTO<int>(0, ex.Message);
            }
        }
    }
}