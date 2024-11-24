using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using API_VotoTotal.Data;
using API_VotoTotal.Models;

namespace API_VotoTotal.Controllers
{
    [ApiController]
    [Route("[CandidatosController]")]
    public class CandidatosController : ControllerBase
    {
        private readonly VotoTotalContext _context;

        public CandidatosController(VotoTotalContext context)
        {
            _context = context;
        }

        // GET: Candidatos
        [HttpGet(Name = "GetIndex")]
        public IEnumerable<Candidatos> Get()
        {
            return Enumerable.Range(1, 5).Select(index => new Candidatos
            {
                Date = DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
                TemperatureC = Random.Shared.Next(-20, 55),
            })
            .ToArray();
        }

        // GET: Candidatos/Details/5
        [HttpGet(Name = "GetDetails")]
        public IEnumerable<Provincia> Details() { 

            return Enumerable.Range(1, 5).Select(index => new Provincia
            {
                Date = DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
                TemperatureC = Random.Shared.Next(-20, 55),
            })
            .ToArray();
        }

        // GET: Candidatos/Edit/5
        [HttpGet]
        public IEnumerable<VotosTotales> Edit()
        {
          
            return Enumerable.Range(1, 5).Select(index => new VotosTotales
            {
                Date = DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
                TemperatureC = Random.Shared.Next(-20, 55),
            })
            .ToArray();
        }

        private bool CandidatosExists(string id)
        {
            return _context.Candidatos.Any(e => e.ID == id);
        }
    }
}
