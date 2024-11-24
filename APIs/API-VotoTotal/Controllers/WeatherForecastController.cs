using API_VotoTotal.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API_VotoTotal.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger, VotoTotalContext context)
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
            var VotosTotales = await _context.VotosTotales.ToListAsync();
            return Ok(VotosTotales);
        }

        // GET: Candidatos/Details/5
        [HttpGet("Provincias")]
        public async Task<IActionResult> Provincias()
        {
            var Provincias = await _context.Provincias.ToListAsync();
            return Ok(Provincias);
        }

        // GET: Candidatos/Edit/5
        [HttpGet("Candidatos")]
        public async Task<IActionResult> Candidatos()
        {
            var Candidatos = await _context.Candidatos.ToListAsync();
            return Ok(Candidatos);
        }

    }
}
