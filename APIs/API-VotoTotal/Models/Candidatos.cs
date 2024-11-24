using Microsoft.EntityFrameworkCore;

namespace API_VotoTotal.Models
{
    [PrimaryKey(nameof(candidato_id))]

    public class Candidatos
    {

        public string candidato_id { get; set; }

        public string nombre { get; set; }
        public int VotosCandidato { get; set; }
       

    }
}
