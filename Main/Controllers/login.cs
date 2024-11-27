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

//datos de prueba: codigo: ni0264, cedula 8-1005-1990

//////////////////IMPORTANTE//////////////////////
///Desactivar .net hot reload para que el proyecto redirija a las papeletas
///https://stackoverflow.com/questions/68952259/disabling-hot-reload-for-net-core-project-in-visual-studio-2019
///"In VS2022, unchecking the "Enable Hot Reload" setting under the projects Debug Properties disables the injection of the aspnetcore-browser-refresh.js script.
//These screenshots show one way to access the setting:"

/*
 * Carrasco, Nathan
 * Herrera, Francisco
 * Wu, Iván
 * Yasiel Gomez
 */

// este archivo es un api para login con contrasenia (cedula) y codigo en la parte de la cedula (?)

namespace login.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class LoginController : ControllerBase
    {
        [HttpPost]
        public async Task<IActionResult> Login([FromBody] LoginRequest request) // Ejecutado cuando el usuario envía datos por el API
        {
            var baseDeDatos = new ConexionDB();

            // Hashing criptográfico
            byte[] data = Encoding.UTF8.GetBytes(request.Password); // Conveierte contrasenia (cedula) a bytes para hashing
            byte[] dataCodigo = Encoding.UTF8.GetBytes(request.Codigo); // Conveierte codigo en reverso de cedula a bytes para hashing
            byte[] result, resultCodigo, entradaResultResultCodigo, resultFinalHasheado;
            string resultadoStringHexPaginaWeb;

            using (SHA512 sha512 = SHA512.Create())
            {
                //algoritmo de hashing criptografico
                result = sha512.ComputeHash(data);
                resultCodigo = sha512.ComputeHash(dataCodigo);

                entradaResultResultCodigo = new byte[result.Length + resultCodigo.Length];
                result.CopyTo(entradaResultResultCodigo, 0);
                resultCodigo.CopyTo(entradaResultResultCodigo, result.Length);

                resultFinalHasheado = sha512.ComputeHash(entradaResultResultCodigo);
            }

            resultadoStringHexPaginaWeb = Convert.ToHexString(resultFinalHasheado); //convertir hash en bytes a string hex; timar en cuenta el limite de largo de un URL es 2048 letras
            string resultadoContraseniaStringHexInterno = Convert.ToHexString(result);
            string resultadoCodigoStringHexInterno = Convert.ToHexString(resultCodigo);

            bool ReslultadoBaseDeDatos = await baseDeDatos.AutenticacionAsync(resultadoContraseniaStringHexInterno, resultadoCodigoStringHexInterno);

            if (ReslultadoBaseDeDatos)
            {
                await generarPapeletaAsync(resultadoStringHexPaginaWeb);
                await baseDeDatos.RegistrarQueVotoAsync(resultadoStringHexPaginaWeb, resultadoContraseniaStringHexInterno);

                return Ok(new { message = $"https://localhost:7089/Home/PapeletaGit/{resultadoStringHexPaginaWeb}.html" });
            }
            else
            {
                return Unauthorized(new { message = "Invalid username or password." });
            }
        }

        public class LoginRequest
        {
            public string Codigo { get; set; }
            public string Password { get; set; }
        }

        internal class ConexionDB
        {
            private readonly string detallesConexion = "Data Source=localhost;Initial Catalog=PadronElectoral;Integrated Security=True;TrustServerCertificate=True";
            // Método para autenticar usuario
            internal async Task<bool> AutenticacionAsync(string contraseniaVer, string codigo)
            {
                try
                {
                    using (SqlConnection conexion = new SqlConnection(detallesConexion))
                    {
                        await conexion.OpenAsync();

                        using (SqlCommand command = new SqlCommand("Autenticacion", conexion))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@cedula", contraseniaVer);
                            command.Parameters.AddWithValue("@pin", codigo);

                            int result = (int)await command.ExecuteScalarAsync();
                            return result == 1;
                        }
                    }
                }
                catch (SqlException ex)
                {
                    throw new Exception("Error en la autenticación: " + ex.Message);
                }
            }

            internal async Task RegistrarQueVotoAsync(string link, string contraseniaRegistrar)
            {
                try
                {
                    using (SqlConnection conexion = new SqlConnection(detallesConexion))
                    {
                        await conexion.OpenAsync();

                        using (SqlCommand command = new SqlCommand("InsertVarcharValue", conexion))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@link", link);
                            command.Parameters.AddWithValue("@cedula_hash", contraseniaRegistrar);

                            await command.ExecuteNonQueryAsync();
                        }
                    }
                }
                catch (SqlException ex)
                {
                    throw new Exception("Error al registrar el voto: " + ex.Message);
                }
            }
        }

        private async Task generarPapeletaAsync(string resultadoStringHexPaginaWeb)
        {
            try
            {
                string sourceFilePath = "PapeletaGit/papeleta.html";
                string destinationFolder = "Home/PapeletaGit";
                string newFileName = $"{resultadoStringHexPaginaWeb}.html";
                string destinationFilePath = Path.Combine(destinationFolder, newFileName);

                using (FileStream sourceStream = new FileStream(sourceFilePath, FileMode.Open, FileAccess.Read))
                using (FileStream destinationStream = new FileStream(destinationFilePath, FileMode.Create, FileAccess.Write))
                {
                    await sourceStream.CopyToAsync(destinationStream);
                }
            }
            catch (Exception ex)
            {
                throw new Exception($"Error al generar la papeleta: {ex.Message}");
            }
        }
    }
}
