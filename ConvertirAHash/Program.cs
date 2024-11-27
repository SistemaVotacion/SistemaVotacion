using System;
using Microsoft.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

class Program
{
    static void Main(string[] args)
    {
        string sourceConnectionString = "Data Source=localhost;Initial Catalog=prueba;Integrated Security=True;TrustServerCertificate=True";
        string destinationConnectionString = "Data Source=localhost;Initial Catalog=PadronElectoral;Integrated Security=True;TrustServerCertificate=True";
        string sourceTable = "cedula#"; // Replace with your source table name
        string destinationTable = "Padron"; // Replace with your destination table name


        try
        {
            // Connect to the source database
            using (SqlConnection sourceConnection = new SqlConnection(sourceConnectionString))
            {
                sourceConnection.Open();
                string selectQuery = $"SELECT * FROM {sourceTable}";

                using (SqlCommand selectCommand = new SqlCommand(selectQuery, sourceConnection))
                using (SqlDataReader reader = selectCommand.ExecuteReader())
                {
                    // Connect to the destination database
                    using (SqlConnection destinationConnection = new SqlConnection(destinationConnectionString))
                    {
                        destinationConnection.Open();

                        // Iterate through the source data
                        while (reader.Read())
                        {
                            // Hash the first column value
                            string originalValueFirstColumn = reader[0].ToString();
                            string hashedValueFirstColumn = HashValue(originalValueFirstColumn);

                            // Get the second column value
                            string secondColumnValue = reader[1].ToString();

                            // Hash the PIN (third column)
                            string originalPin = reader[2].ToString();
                            string hashedPin = HashValue(originalPin);

                            // Insert the hashed values and second column into the destination table
                            string insertQuery = $"INSERT INTO {destinationTable} (cedula_hash, provincia, pin_hash) VALUES (@HashedValue, @SecondColumn, @HashedPin)";
                            using (SqlCommand insertCommand = new SqlCommand(insertQuery, destinationConnection))
                            {
                                insertCommand.Parameters.AddWithValue("@HashedValue", hashedValueFirstColumn);
                                insertCommand.Parameters.AddWithValue("@SecondColumn", secondColumnValue);
                                insertCommand.Parameters.AddWithValue("@HashedPin", hashedPin);
                                insertCommand.ExecuteNonQuery();
                            }
                        }
                    }
                }
            }

            Console.WriteLine("Data hashed, copied, and inserted successfully.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"An error occurred: {ex.Message}");
        }
    }

    // Method to hash a value using SHA-256
    static string HashValue(string value)
    {
        using (SHA256 sha256 = SHA256.Create())
        {
            byte[] bytes = Encoding.UTF8.GetBytes(value);
            byte[] hash = sha256.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }
    }
}
