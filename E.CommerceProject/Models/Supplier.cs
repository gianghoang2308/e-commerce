using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("Supplier")]
    public class Supplier
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "nvarchar(250)")]
        [Required(ErrorMessage = "Tên nhà cung cấp không được để trống.")]
        [StringLength(250)]
        public string Name { get; set; } = string.Empty;

        [Column(TypeName = "nvarchar(250)")]
        [StringLength(250)]
        public string Address { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [StringLength(250)]
        [EmailAddress(ErrorMessage = "Email không hợp lệ.")]
        public string Email { get; set; } = string.Empty;

        [Column(TypeName = "varchar(50)")]
        [StringLength(50)]
        [Phone(ErrorMessage = "Số điện thoại không hợp lệ.")]
        public string Phone { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [StringLength(250)]
        public string TaxCode { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [StringLength(250)]
        public string Website { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [StringLength(250)]
        public string Logo { get; set; } = string.Empty;

        [Required]
        public DateTime CreatedDate { get; set; } = DateTime.Now;

        [Required]
        public DateTime UpdatedDate { get; set; }

        public ICollection<Product> Products { get; set; } = new List<Product>();
    }
}
