using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

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
            
            ConexionDB baseDeDatos = new ConexionDB();
            user = baseDeDatos.ObtenerDatos(request.Password, request.Username);




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
            private string detallesConexion = "Data Source=localhost;Initial Catalog=SistemaVotacionPadron;Integrated Security=True";

            private static readonly List<UserAuth> Users = new List<UserAuth>();

            // Método para obtener todas las reservas existentes
            internal DataSet ObtenerDatos(string contraseniaVer, string usuarioVer)
            {
                DataSet datos = new DataSet();
                try
                {
                    using (SqlConnection conexion = new SqlConnection(detallesConexion)) { 
                    

                        SqlCommand command = new SqlCommand("CrearReserva", conexion);
                        command.CommandType = CommandType.StoredProcedure;

                        // Agregar los parámetros del procedimiento
                        command.Parameters.AddWithValue("@contrasenia", contraseniaVer);
                        command.Parameters.AddWithValue("@usuario", usuarioVer);
                        command.Parameters.Add("@returnValue", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;




                        // Abrir la conexión y ejecutar el procedimiento almacenado
                        command.Connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            Users.Add(new User()
                            {
                                UserID = (int)reader[0],
                                FirstName = (string)reader[1],
                            });
                        }
                        reader.Close();

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