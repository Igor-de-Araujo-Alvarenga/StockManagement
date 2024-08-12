using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockManagement.Domain
{
    public record DefaultDTO<T>(T Data, string Message = "Success!");
}
