using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("Contact")]
    public class Contact
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Tên liên hệ không được để trống.")]
        public string FullName { get; set; } = string.Empty;

        [Column(TypeName = "varchar(50)")]
        [Required(ErrorMessage = "Số điện thoại không được để trống.")]
        [Phone(ErrorMessage = "Vui lòng nhập đúng định dạng số điện thoại.")]
        public string PhoneNumber { get; set; } = string.Empty;

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Địa chỉ không được để trống.")]
        public string Address { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [MaxLength(250)]
        [EmailAddress(ErrorMessage = "Email không hợp lệ.")]
        public string Email { get; set; } = string.Empty;

        [Column(TypeName = "ntext")]
        [Required(ErrorMessage = "Tin nhắn không được để trống.")]
        public string Message { get; set; } = string.Empty;
    }
}
