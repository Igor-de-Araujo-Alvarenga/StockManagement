using StockManagement.Application;
using StockManagement.Application.Interfaces;
using StockManagement.DAL;
using StockManagement.DAL.Interfaces;
using StockManagement.Persistence;

namespace StockManagement.API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            ApplicationServices(builder.Services);
            DALServices(builder.Services);
            builder.Services.AddDbContext<stockContext>();
            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();
            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }

        private static void ApplicationServices(IServiceCollection service)
        {
            service.AddScoped<IStockApplication, StockApplication>();
        }

        private static void DALServices(IServiceCollection service) 
        {
            service.AddScoped<IProductDAL, ProductDAL>();
        }
    }
}