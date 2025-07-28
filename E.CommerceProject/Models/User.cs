using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("User")]
    public class User
    {
        [Key]
        public int Id { get; set; }

        public Guid UserId { get; set; } = Guid.NewGuid();

        [Column(TypeName = "varchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Nhập vào tài khoản user bạn muốn khởi tạo.")]
        public string UserAccount { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Mật khẩu không được để trống.")]
        public string UserPassword { get; set; } = string.Empty;

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Nhập đầy đủ họ và tên")]
        public string FullName { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [Required(ErrorMessage = "Ảnh đại diện không được để trống")]
        public string Avatar { get; set; } = string.Empty;

        [Column(TypeName = "nvarchar(20)")]
        [Required(ErrorMessage = "Số điện thoại không để trống.")]
        [Phone(ErrorMessage = "Vui lòng nhập đúng định dạng số điện thoại.")]
        public string PhoneNumber { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [MaxLength(250, ErrorMessage = "Địa chỉ tối đa 250 ký tự.")]
        [Required(ErrorMessage = "Email không được để trống.")]
        [EmailAddress(ErrorMessage = "Địa chỉ email bạn nhập không hợp lệ, vui lòng nhập lại.")]
        public string Email { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [Required(ErrorMessage = "Ảnh mặt trước CMT/CCCD không được để trống.")]
        public string IdCardFront { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [Required(ErrorMessage = "Ảnh mặt sau CMT/CCCD không được để trống.")]
        public string IdCardBack { get; set; } = string.Empty;

        [Column(TypeName = "datetime")]
        [Required(ErrorMessage = "Ngày cấp CMT/CCCD không được để trống.")]
        public DateTime? DateOfIssue { get; set; }

        [Column(TypeName = "nvarchar(250)")]
        [Required(ErrorMessage = "Nơi cấp CMT/CCCD không được để trống.")]
        public string PlaceOfIssue { get; set; } = string.Empty;

        [Required(ErrorMessage = "Vui lòng không bỏ trống")]
        public int RoleId { get; set; }

        [Column(TypeName = "datetime")]
        public DateTime CreateTime { get; set; } = DateTime.Now;

        [ForeignKey("RoleId")]
        public virtual Role Role { get; set; }

        public ICollection<WishList> wishLists { get; set; } = new List<WishList>();
        public ICollection<Comment> Comments { get; set; } = new List<Comment>();

        public ICollection<Order> Orders { get; set; } = new List<Order>();
    }
}
