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
        private static readonly List<User> Users = new()
        {
            new User { Username = "user1", Password = "password1" },
            new User { Username = "user2", Password = "password2" }
        };

        [HttpPost]
        public IActionResult Login([FromBody] LoginRequest request)
        {
            var user = Users.FirstOrDefault(u => u.Username == request.Username && u.Password == request.Password);
            if (user != null)
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
            internal DataSet ObtenerDatos(int tipo)
            {
                DataSet datos = new DataSet();
                try
                {
                    using (SqlConnection conexion = new SqlConnection(detallesConexion))
                    {
                        switch (tipo)
                        {

                            case 0:
                                string query = "SELECT id_reserva, nombre, habitacion, fecha_entrada, fecha_salida," +
                                    " monto_total FROM [Hotel_otaku].[dbo].[Reservas]";
                                SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion);
                                adaptador.Fill(datos, "Reservas");
                                break;
                            default:
                                break;

                        }
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
