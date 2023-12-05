using System.ComponentModel.DataAnnotations;

namespace BE.FInalAmadis.IdentityLayer.Core.Dtos
{
    public class UpdatePermissionDto
    {
        [Required(ErrorMessage = "UserName is required")]
        public string UserName { get; set; }

    }
}
