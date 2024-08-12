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
    }
}