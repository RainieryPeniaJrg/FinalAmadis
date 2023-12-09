using BE_Api.DTOs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json.Linq;

namespace BE_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstadoClimaController : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<WeatherResponseDTO>> GetEstadoClima(string latitud, string longitud)
        {
            try
            {
                string apiKey = "aa4c6915571bf2229f2afe8bebd29f0d";
                string apiUrl = $"http://api.openweathermap.org/data/2.5/weather?lat={latitud}&lon={longitud}&appid={apiKey}";

                using (HttpClient client = new HttpClient())
                {
                    HttpResponseMessage response = await client.GetAsync(apiUrl);

                    if (response.IsSuccessStatusCode)
                    {
                        string jsonResponse = await response.Content.ReadAsStringAsync();

                        // Deserializar la respuesta JSON
                        WeatherResponseDTO weatherData = Newtonsoft.Json.JsonConvert.DeserializeObject<WeatherResponseDTO>(jsonResponse);

                        return Ok(weatherData);
                    }
                    else
                    {
                        Console.WriteLine($"Error al obtener el clima. Código de respuesta: {response.StatusCode}");
                        return StatusCode((int)response.StatusCode, "Error al obtener el clima");
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine($"Error en la solicitud: {e.Message}");
                return StatusCode(500, $"Error interno del servidor: {e.Message}");
            }
        }
    }
}
