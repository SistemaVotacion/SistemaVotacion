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
using System.Security.Cryptography;
using System.Collections;
using System.Numerics;
using System.Text.Json;

/*
 * Carrasco, Nathan
 * Herrera, Francisco
 * Wu, Iván
 */

// este archivo es un api para login con contrasenia (cedula) y codigo en la parte de la cedula (?)

namespace login.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class LoginController : ControllerBase
    {

        [HttpPost] 
        public IActionResult Login([FromBody] LoginRequest request) // se ejecuta cuando el usuario manda datos por el api
        {
            ConexionDB baseDeDatos = new ConexionDB();

            //algoritmo de hashing criptografico
            byte[] data = Encoding.UTF8.GetBytes(request.Password); // Conveierte contrasenia (cedula) a bytes para hashing
            byte[] result; //resultado de hashing en bytes
            string resultadoBase54;

            using (SHA512 sha512 = SHA512.Create())
            {
                result = sha512.ComputeHash(data);
            }

            resultadoBase54 = System.Convert.ToBase64String(result); //convertir hash en bytes a string en base64; timar en cuenta el limite de largo de un URL es 2048 letras


            //el metorod retorna una lista
            var usuarioLogin = baseDeDatos.ObtenerDatos(request.Password, request.Username);




            var user = usuarioLogin.FirstOrDefault(u => u.Username == request.Username && u.Password == request.Password); // verificar usuario

            if (user != null)
            {
                return Ok(new { message = "https://localhost/"}); //aqui poner URL:  "https://localhost/ + provincia + "-" + hashEnBase64"
            } 
            return Unauthorized(new { message = "Invalid username or password." });
        }

        public class LoginRequest //dfhkb
        {
            public string Username { get; set; }
            public string Password { get; set; }
        }

        public class UserAuth
        {
            public string Username { get; set; }
            public string Password { get; set; }
        }

        internal class ConexionDB
        {
            private string detallesConexion = "Data Source=localhost;Initial Catalog=SistemaVotacionPadron;Integrated Security=True";

            private static readonly List<UserAuth> Users = new List<UserAuth>();

            // Método para obtener todas las reservas existentes
            internal List<UserAuth> ObtenerDatos(string contraseniaVer, string usuarioVer) //lista donde los contenidos de los slementos se especifican en la clase UserAuth
            {
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
                            Users.Add(new UserAuth()
                            {
                                Username = (string)reader[0], //username y password estan especificados en la clase UserAuth
                                Password = (string)reader[1],
                            });
                        }
                        reader.Close();

                    }
                }
                catch (SqlException ex)
                {
                    throw new Exception("Error al obtener libros: " + ex.Message);
                }
                return Users;
            }
        }



    }
}
