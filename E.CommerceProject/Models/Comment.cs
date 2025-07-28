using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("Comment")]
    public class Comment
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [ForeignKey("Product")]
        public int ProductId { get; set; }

        [Required]
        [ForeignKey("User")]
        public int UserId { get; set; }

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Họ và tên không được để trống.")]
        public string FullName { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [MaxLength(250)]
        [EmailAddress(ErrorMessage = "Email không hợp lệ.")]
        public string Email { get; set; } = string.Empty;

        [Column(TypeName = "ntext")]
        [Required(ErrorMessage = "Bình luận không được để trống.")]
        public string CommentText { get; set; } = string.Empty;

        [Column(TypeName = "datetime")]
        [Required]
        public DateTime CreateTime { get; set; } = DateTime.Now;

        [Range(1, 5, ErrorMessage = "Đánh giá phải từ 1 đến 5.")]
        public int Rate { get; set; }

        public virtual Product Product { get; set; }
        public virtual User User { get; set; }
    }
}
