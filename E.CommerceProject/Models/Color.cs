using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("Color")]
    public class Color
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "varchar(250)")]
        [StringLength(250)]
        [Required]
        public string ColorCode { get; set; } = string.Empty;

        [Column(TypeName = "nvarchar(250)")]
        [StringLength(250)]
        [Required]
        public string ColorName { get; set; } = string.Empty;
        public ICollection<Product> Products { get; set; } = new List<Product>();
    }
}
