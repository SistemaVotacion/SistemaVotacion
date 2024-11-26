using Microsoft.EntityFrameworkCore;

namespace API_VotoTotal.Models
{
    [Keyless]

    public class Candidatos
    {
        public string nombre { get; set; }
        public int VotosCandidato { get; set; }
       

    }
}
