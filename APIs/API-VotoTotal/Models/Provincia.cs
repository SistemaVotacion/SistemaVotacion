using Microsoft.EntityFrameworkCore;
using Mono.TextTemplating;

namespace API_VotoTotal.Models
{
    [Keyless]

    public class Provincia
    {
        public string nombre { get; set; }
        public int VotosProvincia { get; set; }

    }
}
