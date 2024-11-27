// Using statements
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;


/*
 * Carrasco, Nathan
 * Herrera, Francisco
 * Wu, Iván
 * Yasiel Gomez
 */

// Namespace


namespace ApiPapeleta.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class VotingController : ControllerBase
    {
        private readonly string _connectionString = "Data Source=localhost;Initial Catalog=RegistroDeVoto;Integrated Security=True;TrustServerCertificate=True";

        [HttpPost("vote")]
        public async Task<IActionResult> PostVote([FromBody] VoteRequest voteRequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new { message = "Invalid vote data." });
            }

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                using (SqlCommand command = new SqlCommand("RegistrarVoto", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Provincia", voteRequest.UserId);
                    command.Parameters.AddWithValue("@CandidatoId", voteRequest.CandidateId);

                    try
                    {
                        await command.ExecuteNonQueryAsync();


                        return Ok(new { message = "Vote recorded successfully." });
                    }
                    catch (SqlException ex)
                    {
                        if (ex.Message.Contains("ya ha votado"))
                        {
                            return Conflict(new { message = "El usuario ya ha votado." });
                        }

                        return StatusCode(500, new { message = "Error recording vote: " + ex.Message });
                    }
                }
            }
        }

    }

    public class VoteRequest
    {
        [Required]
        public string UserId { get; set; } = string.Empty;

        [Required]
        public int CandidateId { get; set; }
    }

    public class Candidate
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Party { get; set; } = string.Empty;
        public string Province { get; set; } = string.Empty;
    }
}