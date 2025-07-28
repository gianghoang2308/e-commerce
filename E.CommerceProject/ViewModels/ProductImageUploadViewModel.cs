using System.ComponentModel.DataAnnotations;

namespace E.CommerceProject.ViewModels
{
    public class ProductImageUploadViewModel
    {
        [Required]
        public int ProductId { get; set; }

        [Required]
        public List<IFormFile> Images { get; set; }
    }
}
