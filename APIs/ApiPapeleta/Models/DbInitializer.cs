using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using ApiPapeleta.Models;
using System.Diagnostics;
namespace ApiPapeleta.Models
{
   
        public static class DbInitializer
        {
            public static void Initialize(RegistroDeVotoDbContext context)
            {
                //context.Database.EnsureCreated();

                // Look for any students.
                if (context.Votos.Any())
                {
                    return;   // DB has been seeded
                }

               
            }
        }
    
}
