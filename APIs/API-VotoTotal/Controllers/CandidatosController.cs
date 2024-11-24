using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using API_VotoTotal.Data;
using API_VotoTotal.Models;
using Microsoft.Extensions.Options;

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
        [HttpGet(Name = "GetVotosTotales")]
        public async Task<IActionResult> VotosTotales()
        {
            var VotosTotales = await _context.VotosTotales.ToListAsync();
            return Ok(VotosTotales);
        }

        // GET: Candidatos/Details/5
        [HttpGet(Name = "GetProvincias")]
        public async Task<IActionResult> Provincias()
        {
            var Provincias = await _context.Provincias.ToListAsync();
            return Ok(Provincias);
        }

        // GET: Candidatos/Edit/5
        [HttpGet(Name = "GetCandidatos")]
        public async Task<IActionResult> Candidatos()
        {
            var Candidatos = await _context.Candidatos.ToListAsync();
            return Ok(Candidatos);
        }

        private bool CandidatosExists(string id)
        {
            return _context.Candidatos.Any(e => e.ID == id);
        }
    }
}
