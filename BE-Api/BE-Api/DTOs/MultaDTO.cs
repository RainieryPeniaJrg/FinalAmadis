namespace BE_Api.DTOs
{
    public class MultaDTO
    {
        public int Id { get; set; }
        public string? Cedula { get; set; }
        public string? PlacaVehiculo { get; set; }
        public int? MotivoMultaId { get; set; }
        public int? VehiculoId { get; set; }
        //public string? Foto { get; set; }
        public string? Comentario { get; set; }
        public double? Latitud { get; set; }
        public double? Longitud { get; set; }
        public DateTime? Fecha { get; set; }
     
    }
}
