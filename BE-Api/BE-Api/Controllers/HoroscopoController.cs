using BE_Api.DTOs;
using Microsoft.AspNetCore.Mvc;

namespace BE_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HoroscopoController : Controller
    {
        private readonly HttpClient _httpClient;

        public HoroscopoController(IHttpClientFactory httpClientFactory)
        {
            _httpClient = httpClientFactory.CreateClient();
            _httpClient.BaseAddress = new Uri("https://horoscope-app-api.vercel.app/");
        }

        [HttpGet("daily")]
        public async Task<ActionResult> GetHoroscopoDiario(string sign)
        {
            try
            {
                string day = "TODAY"; 

                string url = $"api/v1/get-horoscope/daily?sign={sign}&day={day}";

                HttpResponseMessage response = await _httpClient.GetAsync(url);

                if (response.IsSuccessStatusCode)
                {
                    string jsonResponse = await response.Content.ReadAsStringAsync();
                    return Ok(jsonResponse); // Retorna la respuesta JSON
                }
                else
                {
                    return StatusCode((int)response.StatusCode, "Error al obtener el horóscopo.");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }
    }
}
