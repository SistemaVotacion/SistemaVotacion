using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
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

//falta mientras la votación esta en progreso el número de votos por candidato
//podría ser 0 si la base de datos no se puede acceder por estar bloqueada durante la votación 

//(despues)tuplas en listas en c# en API login
//(después)confiar en certificado base de datos API login
// (despues)bytes en hexadecimal en string en vez de base64 para simplicidad 
//(despues)mover archivos en servidor para renombrar papeletas y darlas por el API
// API para registrar el voto
// API para estadisticas
// arreglar html
// separar css en global y local
// hacer javascript de login, papeleta
// hacer variante para desarrollo 5 que solo valide la cédula pero no la revisa con bd
// hacer trabajo escrito
// hacer Canva
// hacer wireframes
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

            //para hacer hasing criptografico para que no se puedan facilmente deducir cedulas desde el sistema, ayuda a mantener el secreto del voto
            byte[] data = Encoding.UTF8.GetBytes(request.Password); // Conveierte contrasenia (cedula) a bytes para hashing
            byte[] dataCodigo = Encoding.UTF8.GetBytes(request.Password); // Conveierte codigo en reverso de cedula a bytes para hashing
            byte[] result; //resultado de hashing en bytes
            byte[] resultCodigo; //resultado de hashing en bytes
            string resultadoBase54;

            //algoritmo de hashing criptografico
            using (SHA512 sha512 = SHA512.Create())
            {
                result = sha512.ComputeHash(data);
                resultCodigo = sha512.ComputeHash(dataCodigo);

            }

            resultadoBase54 = System.Convert.ToBase64String(result); //convertir hash en bytes a string en base64; timar en cuenta el limite de largo de un URL es 2048 letras


            //el metorod retorna una lista
            var usuarioLogin = baseDeDatos.ObtenerDatos(request.Password, request.Username);


            //falta concatenar la cedula y el dato en la parte de atras de la cedula

            var user = usuarioLogin.FirstOrDefault(u => u.Username == result && u.Password == resultCodigo); // verificar usuario

            if (user != null)
            {
                return Ok(new { message = "https://localhost/"}); //aqui poner URL:  "https://localhost/ + provincia + "-" + hashEnBase64"
            } 
            return Unauthorized(new { message = "Invalid username or password." });
        }

        public class LoginRequest //lo que se acepta de los usuarios
        {
            public string Username { get; set; }
            public string Password { get; set; }

        }

        public class UserAuth // para uso interno del progrma, como guardar datos
        {
            public Byte[] Username { get; set; }
            public Byte[] Password { get; set; }

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
                                Username = (Byte[])reader[0], //username y password estan especificados en la clase UserAuth
                                Password = (Byte[])reader[1],
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
