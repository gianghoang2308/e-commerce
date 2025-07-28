using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("Config")]
    public class Config
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "varchar(250)")]
        [MaxLength(250, ErrorMessage = "Địa chỉ tối đa 250 ký tự.")]
        [Required(ErrorMessage = "Email không được để trống.")]
        [EmailAddress(ErrorMessage = "Địa chỉ email bạn nhập không hợp lệ, vui lòng nhập lại.")]
        public string Mail1 { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        public string? Mail2 { get; set; } = "";

        [Column(TypeName = "varchar(250)")]
        public string? Mail3 { get; set; } = "";

        [Column(TypeName = "varchar(250)")]
        public string? Mail4 { get; set; } = "";

        [Column(TypeName = "varchar(250)")]
        public string? Mail5 { get; set; } = "";

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250, ErrorMessage = "Contact tối đa 250 ký tự.")]
        public string? Contact { get; set; } = "";

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250, ErrorMessage = "Tiêu đề tối đa 250 ký tự.")]
        public string Title { get; set; } = "";

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250, ErrorMessage = "Mô tả tối đa 250 ký tự.")]
        public string? Description { get; set; }

        [Column(TypeName = "nvarchar(20)")]
        [Required(ErrorMessage = "Số điện thoại không để trống.")]
        [Phone(ErrorMessage = "Vui lòng nhập đúng định dạng số điện thoại.")]
        public string Hotline { get; set; } = string.Empty;

        [Column(TypeName = "nvarchar(250)")]
        [Required(ErrorMessage = "Địa chỉ không để trống.")]
        [MaxLength(250, ErrorMessage = "Địa chỉ tối đa 250 ký tự.")]
        public string Address { get; set; } = string.Empty;

        [Column(TypeName = "nvarchar(250)")]
        public string? Keyword { get; set; } = "";

        [Column(TypeName = "varchar(150)")]
        [MaxLength(150, ErrorMessage = "Link Facebook dài tối đa 150 ký tự.")]
        [Required(ErrorMessage = "Link Facebook không được để trống.")]
        public string SocialLink1 { get; set; } = string.Empty;

        [Column(TypeName = "varchar(150)")]
        [MaxLength(150, ErrorMessage = "Link Instagram dài tối đa 150 ký tự.")]
        [Required(ErrorMessage = "Link Instagram không được để trống.")]
        public string SocialLink2 { get; set; } = string.Empty;

        [Column(TypeName = "varchar(150)")]
        [MaxLength(150, ErrorMessage = "Link Youtube dài tối đa 150 ký tự.")]
        [Required(ErrorMessage = "Link Youtube không được để trống.")]
        public string SocialLink3 { get; set; } = string.Empty;

        [Column(TypeName = "varchar(150)")]
        [MaxLength(150, ErrorMessage = "Link Github dài tối đa 150 ký tự.")]
        [Required(ErrorMessage = "Link Github không được để trống.")]
        public string SocialLink4 { get; set; } = string.Empty;

        [Column(TypeName = "varchar(150)")]
        [MaxLength(150, ErrorMessage = "Link LinkedIn dài tối đa 150 ký tự.")]
        [Required(ErrorMessage = "Link LinkedIn không được để trống.")]
        public string SocialLink5 { get; set; } = string.Empty;
    }
}
