using API_VotoTotal.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

/*
 * Carrasco, Nathan
 * Herrera, Francisco
 * Wu, Iván
 * Yasiel Gomez
 */

namespace API_VotoTotal.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class VotoTotal : ControllerBase
    {

        private readonly ILogger<VotoTotal> _logger;

        public VotoTotal(ILogger<VotoTotal> logger, VotoTotalContext context)
        {
            _logger = logger;
            _context = context;

        }

        private readonly VotoTotalContext _context;


        [HttpGet(Name = "GetWeatherForecast")]
        public IEnumerable<WeatherForecast> Get()
        {
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
                TemperatureC = Random.Shared.Next(-20, 55),
            })
            .ToArray();
        }

        [HttpGet("VotosTotales")]
        public async Task<IActionResult> VotosTotales()
        {
            var VotosTotales = await _context.VotosTotales.FromSql($"EXEC VerTotalVotos").ToListAsync();
            return Ok(VotosTotales);
        }

        // GET: Candidatos/Details/5
        [HttpGet("Provincias")]
        public async Task<IActionResult> Provincias()
        {
            var Provincias = await _context.Provincias.FromSql($"EXEC VerVotosPorProvincia").ToListAsync();
            return Ok(Provincias);
        }

        // GET: Candidatos/Edit/5
        [HttpGet("Candidatos")]
        public async Task<IActionResult> Candidatos()
        {
            var Candidatos = await _context.Candidatos.FromSql($"EXEC VerVotosPorCandidato").ToListAsync();
            return Ok(Candidatos);
        }

    }
}
