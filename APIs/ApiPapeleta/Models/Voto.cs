namespace ApiPapeleta.Models
{
    public class Voto
    {
        public int VotoId { get; set; }
        public int? CandidatoId { get; set; }
        public string? Provincia { get; set; }
    }
}
