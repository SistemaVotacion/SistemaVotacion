using Microsoft.EntityFrameworkCore;
using Mono.TextTemplating;

namespace API_VotoTotal.Models
{
    [PrimaryKey(nameof(id_provincia))]

    public class Provincia
    {
        public string id_provincia { get; set; }

        public string nombre { get; set; }
        public int VotosProvincia { get; set; }

    }
}
