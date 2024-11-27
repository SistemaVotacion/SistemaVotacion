using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System;
using System.IO;
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
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

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
        public async Task<IActionResult> Login([FromBody] LoginRequest request) // se ejecuta cuando el usuario manda datos por el api
        {
            ConexionDB baseDeDatos = new ConexionDB();

            //para hacer hasing criptografico para que no se puedan facilmente deducir cedulas desde el sistema, ayuda a mantener el secreto del voto
            byte[] data = Encoding.UTF8.GetBytes(request.Password); // Conveierte contrasenia (cedula) a bytes para hashing
            byte[] dataCodigo = Encoding.UTF8.GetBytes(request.Codigo); // Conveierte codigo en reverso de cedula a bytes para hashing
            byte[] result; //resultado de hashing en bytes
            byte[] resultCodigo; //resultado de hashing en bytes
            byte[] entradaResultResultCodigo;
            byte[] resultFinalHasheado; //resultado de hashing en bytes
            string resultadoStringHexPaginaWeb;

            //algoritmo de hashing criptografico
            using (SHA512 sha512 = SHA512.Create())
            {
                result = sha512.ComputeHash(data);
                resultCodigo = sha512.ComputeHash(dataCodigo);

                entradaResultResultCodigo = new byte[result.Length + resultCodigo.Length];
                result.CopyTo(entradaResultResultCodigo, 0);
                resultCodigo.CopyTo(entradaResultResultCodigo, result.Length);

                resultFinalHasheado = sha512.ComputeHash(entradaResultResultCodigo);

            }
            resultadoStringHexPaginaWeb = System.Convert.ToHexString(resultFinalHasheado); //convertir hash en bytes a string en base64; timar en cuenta el limite de largo de un URL es 2048 letras
            string resultadoContraseniaStringHexInterno = System.Convert.ToHexString(result); //convertir hash en bytes a string en base64; timar en cuenta el limite de largo de un URL es 2048 letras
            string resultadoCodigoStringHexInterno = System.Convert.ToHexString(resultCodigo); //convertir hash en bytes a string en base64; timar en cuenta el limite de largo de un URL es 2048 letras



            bool ReslultadoBaseDeDatos;
            ReslultadoBaseDeDatos = baseDeDatos.Autenticacion(resultadoContraseniaStringHexInterno, resultadoCodigoStringHexInterno);
            return Ok(new { message = ("https://localhost:7089/Home/PapeletaGit/" + "papeleta" + ".html") }); //aqui poner URL: resultadoStringHexPaginaWeb  "https://localhost/  + provincia + "-" + hashEnBase64" // + provincia + resultadoStringHexPaginaWeb + ".html"


            if (ReslultadoBaseDeDatos)
            {
                try
                {
                    // Ask the user for the source file path
                    string sourceFilePath = "PapeletaGit/papeleta.html";

                    string destinationFolder = "Home/PapeletaGit";

                    string newFileName = resultadoStringHexPaginaWeb + ".html";

                    // Create the full destination path
                    string destinationFilePath = Path.Combine(destinationFolder, newFileName);

                    // Copy the file to the new location
                    System.IO.File.Copy(sourceFilePath, destinationFilePath);


                }
                catch (Exception ex)
                {
                    Console.WriteLine($"An error occurred: {ex.Message}");
                }

                ConexionDB conexionDB = new ConexionDB();
                conexionDB.RegistrarQueVoto(resultadoStringHexPaginaWeb, resultadoContraseniaStringHexInterno);

            }
            else
            {
                return Unauthorized(new { message = "Invalid username or password." });
            }
        }

        public class LoginRequest //lo que se acepta de los usuarios
        {
            public string Codigo { get; set; }
            public string Password { get; set; }    

        }

        public class UserAuth // para uso interno del progrma, como guardar datos
        {
            public byte[] Username { get; set; }
            public byte[] Password { get; set; }

        }

        internal class ConexionDB
        {
            private string detallesConexion = "Data Source=localhost;Initial Catalog=PadronElectoral;Integrated Security=True;TrustServerCertificate=True";

            // Método para obtener todas las reservas existentes
            internal bool Autenticacion(string contraseniaVer, string codigo) //lista donde los contenidos de los slementos se especifican en la clase UserAuth
                //se usa una lista para poder retornar varias cosas a la vez
            {

                bool Users;

                try
                {
                    using (SqlConnection conexion = new SqlConnection(detallesConexion)) {
                        //await connection.OpenAsync();


                        SqlCommand command = new SqlCommand("Autenticacion", conexion);
                        command.CommandType = CommandType.StoredProcedure;

                        // Agregar los parámetros del procedimiento
                        command.Parameters.AddWithValue("@cedula", contraseniaVer);
                        command.Parameters.AddWithValue("@pin", codigo);
                      //  command.Parameters.Add("@returnValue", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

                        // Abrir la conexión y ejecutar el procedimiento almacenado
                        command.Connection.Open();
                        int result = (int)command.ExecuteScalar();
                        command.Connection.Close();

                        if (result == 1)
                        {
                            Users = true;

                        }
                        else
                        {
                            Users = false;
                        }
                    }
                }
                catch (SqlException ex)
                {
                    throw new Exception("Error al obtener libros: " + ex.Message);
                }
                return Users;
            }

            internal void RegistrarQueVoto(string link, string contraseniaRegistrar) //lista donde los contenidos de los slementos se especifican en la clase UserAuth
                                                                             //se usa una lista para poder retornar varias cosas a la vez
            {
                try
                {
                    using (SqlConnection conexion = new SqlConnection(detallesConexion))
                    {
                        //await connection.OpenAsync();


                        SqlCommand command = new SqlCommand("InsertVarcharValue", conexion);
                        command.CommandType = CommandType.StoredProcedure;

                        // Agregar los parámetros del procedimiento
                        command.Parameters.AddWithValue("@link", link);
                        command.Parameters.AddWithValue("@cedula_hash", contraseniaRegistrar);

                        //  command.Parameters.Add("@returnValue", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

                        // Abrir la conexión y ejecutar el procedimiento almacenado
                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();
                    }
                }
                catch (SqlException ex)
                {
                    throw new Exception("Error al obtener libros: " + ex.Message);
                }
            }


        }



    }
}
