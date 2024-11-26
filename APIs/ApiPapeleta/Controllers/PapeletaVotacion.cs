// Using statements
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

// Namespace
namespace ApiPapeleta.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class VotingController : ControllerBase
    {
        private readonly string _connectionString = "Data Source=localhost;Initial Catalog=sistema_votacion;Integrated Security=True;TrustServerCertificate=True";

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
                using (SqlCommand command = new SqlCommand("InsertVote", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserId", voteRequest.UserId);
                    command.Parameters.AddWithValue("@CandidateId", voteRequest.CandidateId);

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

        [HttpGet("candidates")]
        public async Task<IActionResult> GetCandidates()
        {
            List<Candidate> candidates = new List<Candidate>();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                using (SqlCommand command = new SqlCommand("SELECT CandidateId, Name, Party, Province FROM Candidates", connection))
                {
                    using (SqlDataReader reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            candidates.Add(new Candidate
                            {
                                Id = reader.GetInt32(0),
                                Name = reader.GetString(1),
                                Party = reader.GetString(2),
                                Province = reader.GetString(3)
                            });
                        }
                    }
                }
            }

            return Ok(candidates);
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