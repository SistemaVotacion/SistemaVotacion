using Microsoft.AspNetCore.Mvc;
using ApiPapeleta.Models;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace ApiPapeleta.Controllers
{
    
        [ApiController]
        [Route("api/[controller]")]
        public class VotosController : ControllerBase
        {
            private readonly RegistroDeVotoDbContext _context;

            public VotosController(RegistroDeVotoDbContext context)
            {
                _context = context;
            }

            // Endpoint para obtener los totales de votos
            [HttpGet("totales")]
            public async Task<ActionResult<object>> ObtenerTotales()
            {
                var totalRegistrados = await _context.Votos.CountAsync();
                var totalVotaron = await _context.Votos.Where(v => v.CandidatoId != null).CountAsync();

                return Ok(new
                {
                    votantes = totalVotaron,
                    total = totalRegistrados
                });
            }
        }
    }   
