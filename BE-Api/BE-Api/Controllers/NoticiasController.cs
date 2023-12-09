using BE_Api.DTOs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json.Linq;

namespace BE_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NoticiasController : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<IEnumerable<NoticiaDTO>>> GetNoticias()
        {
            try
            {
                string apiUrl = "https://remolacha.net/wp-json/wp/v2/posts?search=digeset)";

                using (HttpClient client = new HttpClient())
                {
                    HttpResponseMessage response = await client.GetAsync(apiUrl);

                    if (response.IsSuccessStatusCode)
                    {
                        string jsonString = await response.Content.ReadAsStringAsync();
                        JArray data = JArray.Parse(jsonString);

                        List<NoticiaDTO> noticias = new List<NoticiaDTO>();

                        foreach (var post in data) { 
                            string title = post["title"]["rendered"].ToString();

                            string description = post["excerpt"]["rendered"].ToString();

                            string imageUrl = post["jetpack_featured_media_url"]?.ToString() ?? "";
                            if (!string.IsNullOrEmpty(imageUrl))
                            {
                                HttpResponseMessage imageResponse = await client.GetAsync(imageUrl);

                                if (imageResponse.IsSuccessStatusCode)
                                {
                                    byte[] imageBytes = await imageResponse.Content.ReadAsByteArrayAsync();
                                    string base64Image = Convert.ToBase64String(imageBytes);

                                    NoticiaDTO noticia = new NoticiaDTO
                                    {
                                        Titulo = title,
                                        Descripcion = description,
                                        Imagen = base64Image
                                    };

                                    noticias.Add(noticia);
                                }
                                else
                                {
                                    Console.WriteLine($"Error al obtener la imagen. Código de respuesta: {imageResponse.StatusCode}");
                                }
                            }
                            else
                            {
                                NoticiaDTO noticia = new NoticiaDTO
                                {
                                    Titulo = title,
                                    Descripcion = description,
                                    Imagen = null
                                };

                                noticias.Add(noticia);
                            }

                            NoticiaDTO multa = new NoticiaDTO
                            {
                                Titulo = title,
                                Descripcion = description,
                                Imagen = imageUrl
                            };

                            noticias.Add(multa);
                        }
                        return Ok(noticias);
                    }
                    else
                    {
                        Console.WriteLine($"Error en la solicitud. Código de respuesta: {response.StatusCode}");
                        return StatusCode((int)response.StatusCode, "Error en la solicitud a la API");
                    }
                }
            }
            catch (Exception e)
            {
                return StatusCode(500, $"Error interno del servidor: {e.Message}");
            }
        }
    }
}
