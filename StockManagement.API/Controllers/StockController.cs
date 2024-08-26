using Microsoft.AspNetCore.Mvc;
using StockManagement.Application.Interfaces;
using StockManagement.Domain;

namespace StockManagement.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StockController : ControllerBase
    {

        private IStockApplication StockApplication { get; set; }
        public StockController(IStockApplication stockApplication)
        {
           StockApplication= stockApplication;
        }

        [HttpGet(Name = "Get/{id}")]
        public DefaultDTO<List<ProductDTO>> Get(int id)
        {
            return StockApplication.Get(id);
        }

        [HttpPost(Name = "Post")]
        public DefaultDTO<int> Post(ProductDTO product)
        {
            return StockApplication.Post(product);
        }

        [HttpPut(Name = "Put")]
        public DefaultDTO<int> Put(ProductDTO product)
        {
            return StockApplication.Update(product);
        }

        [HttpDelete(Name = "Delete/{id}")]
        public DefaultDTO<int> Delete(int id)
        {
            return StockApplication.Delete(id);
        }
    }
}