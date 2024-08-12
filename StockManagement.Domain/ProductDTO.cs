using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockManagement.Domain
{
    public record ProductDTO(
         int Id, 
         string? Name,
         string? Description,
         decimal? Price,
         string? Code ,
         int? Quantity ,
         DateTime? CreatedAt ,
         DateTime? UpdatedAt ,
         InformationDTO Category ,
         InformationDTO Size,
         InformationDTO Status
    );
}
