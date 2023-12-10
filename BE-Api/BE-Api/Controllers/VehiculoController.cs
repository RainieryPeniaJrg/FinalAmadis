using BE.FinalAmadis.DataLayer.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BE_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VehiculoController : ControllerBase
    {
        private readonly IVehiculoRepository _repository;

        public VehiculoController(IVehiculoRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        [Route("get-vehiculos")]
        public async Task<IActionResult> GetVehiculos()
        {
            var result = await _repository.GetEntitiesAsync();
            return Ok(result);
        }

        [HttpGet]
        [Route("get-by-placa/{placa}")]
        public async Task<IActionResult> GetVehiculo(string placa)
        {
            var result = await _repository.GetEntityAsync(e=>e.Placa == placa);
            return Ok(result);
        }
    }
}
