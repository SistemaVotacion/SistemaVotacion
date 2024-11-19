using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*
 * Carrasco, Nathan
 * Herrera, Francisco
 * Wu, Iván
 */

namespace login.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class LoginController : ControllerBase
    {
        

        [HttpPost]
        public IActionResult Login([FromBody] LoginRequest request)
        {
    
            if (ObtenerDatos != null)
            {
                return Ok(new { message = "Login successful!" });
            }
            return Unauthorized(new { message = "Invalid username or password." });
        }

        public class LoginRequest //dfhkb
        {
            public string Username { get; set; }
            public string Password { get; set; }
        }

        public class User
        {
            public string Username { get; set; }
            public string Password { get; set; }
        }

        internal class ConexionDB
        {
            private string detallesConexion = "Data Source=localhost;Initial Catalog=Hotel_otaku;Integrated Security=True";

           

            // Método para obtener todas las reservas existentes
            internal DataSet ObtenerDatos()
            {
                DataSet datos = new DataSet();
                try
                {
                    using (SqlConnection conexion = new SqlConnection(detallesConexion))
                    {
                        
                                string query = "SELECT id_reserva, nombre, habitacion, fecha_entrada, fecha_salida," +
                                    " monto_total FROM [Hotel_otaku].[dbo].[Reservas]";
                                SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion);
                                adaptador.Fill(datos, "Reservas");
                            
                    }
                }
                catch (SqlException ex)
                {
                    throw new Exception("Error al obtener libros: " + ex.Message);
                }
                return datos;
            }
        }
    


    }
}
