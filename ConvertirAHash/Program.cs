using Microsoft.Data.SqlClient;
using System.Data;

namespace ConvertirAHash
{
    internal class Program
    {

        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");

            string detallesConexion = "Data Source=localhost;Initial Catalog=SistemaVotacionPadron;Integrated Security=True;TrustServerCertificate=True"

            try
            {

                using (SqlConnection conexion = new SqlConnection(detallesConexion))
                {

                }
            }
            catch (SqlException ex)
            {
            }












            }
    }
}
