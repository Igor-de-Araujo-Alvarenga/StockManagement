
using StockManagement.Application;
using StockManagement.DAL;
using StockManagement.Domain;
using StockManagement.Persistence;

namespace StockManagement.Tests
{
    public class TestProductApplication
    {
        [Fact]
        public void TestPostProducts()
        {
            //Arrange
            var dummyCategory = new InformationDTO(1, "");
            var dummySize = new InformationDTO(1, "");
            var dummyStatus = new InformationDTO(1, "");
            var dummyProduct = new ProductDTO(0, "test", "description", 100, "0000000000", 1, DateTime.Now, null, dummyCategory, dummySize, dummyStatus);

            var productDAL = new ProductDAL(new stockContext());
            var productApplication = new StockApplication(productDAL);
            //Act
            var productIdCreated = productApplication.Post(dummyProduct);
            //Assert
            Assert.True(productIdCreated.Data > 0);
            Assert.Equal("Success!", productIdCreated.Message);
        }

        [Fact]
        public void TestGetAllProducts()
        {
            //Arrange
            var productDAL = new ProductDAL(new stockContext());
            var productApplication = new StockApplication(productDAL);
            //Act
            var listProduct = productApplication.Get(0);
            //Assert
            Assert.NotNull(listProduct);
            Assert.True(listProduct.Data.Count > 0);
            Assert.Equal("Success!", listProduct.Message);
        }

        [Fact]
        public void TestGetOneProduct()
        {
            //Arrange
            var productDAL = new ProductDAL(new stockContext());
            var productApplication = new StockApplication(productDAL);
            //Act
            var listProduct = productApplication.Get(1);
            //Assert
            Assert.NotNull(listProduct);
            Assert.True(listProduct.Data.Count == 1);
            Assert.Equal("Success!", listProduct.Message);
        }

        [Fact]
        public void TestPutProducts()
        {
            //Arrange
            var dummyCategory = new InformationDTO(1, "");
            var dummySize = new InformationDTO(1, "");
            var dummyStatus = new InformationDTO(1, "");
            var dummyProduct = new ProductDTO(1, "test", "description", 100, "0000000000", 1, DateTime.Now, null, dummyCategory, dummySize, dummyStatus);

            var productDAL = new ProductDAL(new stockContext());
            var productApplication = new StockApplication(productDAL);
            //Act
            var productIdUpdated = productApplication.Update(dummyProduct);
            //Assert
            Assert.True(productIdUpdated.Data == 1);
            Assert.Equal("Success!", productIdUpdated.Message);
        }

        [Fact]
        public void TestDeleteProducts()
        {
            //Arrange
            var productDAL = new ProductDAL(new stockContext());
            var productApplication = new StockApplication(productDAL);
            //Act
            var product = productDAL.GetAll();
            var dataReturn = productApplication.Delete(product.LastOrDefault().Id);
            //Assert
            Assert.Equal("Success!", dataReturn.Message);
        }
    }
}