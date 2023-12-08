using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BE.FinalAmadis.DataLayer.Context;
using BE.FinalAmadis.DataLayer.Entities;
using BE_Api.DTOs;

namespace BE_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MultasController : ControllerBase
    {
        private readonly ProyectoContext _context;

        public MultasController(ProyectoContext context)
        {
            _context = context;
        }

        // GET: api/Multas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Multas>>> GetMultas()
        {
          if (_context.Multas == null)
          {
              return NotFound();
          }
            return await _context.Multas.ToListAsync();
        }

        // GET: api/Multas/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Multas>> GetMultas(int id)
        {
          if (_context.Multas == null)
          {
              return NotFound();
          }
            var multas = await _context.Multas.FindAsync(id);

            if (multas == null)
            {
                return NotFound();
            }

            return multas;
        }

        // PUT: api/Multas/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMultas(int id, Multas multas)
        {
            if (id != multas.Id)
            {
                return BadRequest();
            }

            _context.Entry(multas).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MultasExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Multas
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Multas>> PostMultas(MultaDTO multaDto)
        {
            try
            {
                if (_context.Multas == null)
                {
                    return Problem("Entity set 'ProyectoContext.Multas'  is null.");
                }

                ValidarMulta(multaDto);

                Multas multa = new Multas
                {
                    CedulaInfractor = multaDto.Cedula,
                    Comentario = multaDto.Comentario,
                    Fecha = multaDto.Fecha,
                    Hora = multaDto.Hora,
                    FotoEvidencia = multaDto.Foto,
                    Latitud = multaDto.Latitud,
                    Longitud = multaDto.Longitud,
                    TipoMultaId = multaDto.MotivoMultaId,
                    VehiculoId = multaDto.VehiculoId,
                    PlacaVehiculo = multaDto.PlacaVehiculo
                };

                var bytes = Convert.FromBase64String(multaDto.Foto);
                string imagePath = Path.Combine("Imagenes", $"{Guid.NewGuid().ToString("N")}");
                System.IO.File.WriteAllBytes(imagePath, bytes);

                _context.Multas.Add(multa);
                await _context.SaveChangesAsync();

                return CreatedAtAction("GetMultas", new { id = multa.Id }, multa);
            }
            catch (Exception e)
            {

                throw e;
            }
         
        }

        // DELETE: api/Multas/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMultas(int id)
        {
            if (_context.Multas == null)
            {
                return NotFound();
            }
            var multas = await _context.Multas.FindAsync(id);
            if (multas == null)
            {
                return NotFound();
            }

            _context.Multas.Remove(multas);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool MultasExists(int id)
        {
            return (_context.Multas?.Any(e => e.Id == id)).GetValueOrDefault();
        }

        private bool ValidarMulta(MultaDTO multaDto)
        {
            if (string.IsNullOrWhiteSpace(multaDto.Cedula))
            {
                throw new Exception("La cedula es requerida");
            }

            if (string.IsNullOrWhiteSpace(multaDto.PlacaVehiculo))
            {
                throw new Exception("La placa del vehiculo es requerida");
            }
            return true;
        }
    }
}
