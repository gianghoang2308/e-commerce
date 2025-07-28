using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("Category")]
    public class Category
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName ="nvarchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage ="Tên danh mục không được để trống.")]
        public string Name { get; set; } = string.Empty;

        [Required]
        public DateTime CreatedDate { get; set; } = DateTime.Now;

        [Required]
        public DateTime UpdatedDate { get; set; }

        public ICollection<Product> Products { get; set; } = new List<Product>();
    }
}
