using BE.FinalAmadis.DataLayer.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BE_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TipoMultaController : ControllerBase
    {

        private readonly  ITipoMultaRepository _repository;

        [HttpGet]
        [Route("get-tipo-multa")]
        public async Task<IActionResult> GetTipoMulta()
        {
            var result = await _repository.GetEntitiesAsync();

            return Ok(result);
        }
    }
}
