using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("BillingAddress")]
    public class BillingAddress
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập tên người thanh toán.")]
        public string? BillingAddressFirstName { get; set; } = string.Empty;
        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập họ người thanh toán.")]
        public string? BillingAddressLastName { get; set; } = string.Empty;

        [Column(TypeName = "varchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ email người thanh toán.")]
        [EmailAddress(ErrorMessage = "Địa chỉ email không hợp lệ.")]
        public string? BillingAddressEmail { get; set; } = string.Empty;

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ người thanh toán.")]
        public string? BillingAddressAddress { get; set; } = string.Empty;

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập thành phố người thanh toán.")]
        public string? BillingAddressCity { get; set; } = string.Empty;

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập quốc gia người thanh toán.")]
        public string? BillingAddressCountry { get; set; } = string.Empty;

        [Column("BillingAddressZipCode", TypeName = "varchar")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập mã bưu điện người thanh toán.")]
        public string? BillingAddressZipCode { get; set; } = string.Empty;
        [Column("BillingAddressTelephone", TypeName = "varchar")]
        [MaxLength(50)]
        [Required(ErrorMessage = "Vui lòng nhập số điện thoại người thanh toán.")]
        [Phone(ErrorMessage = "Số điện thoại không hợp lệ.")]
        public string? BillingAddressTelephone { get; set; } = string.Empty;

        [Column("ShiptoDifferenceAddress", TypeName = "bit")]
        public bool ShiptoDifferenceAddress { get; set; } = true;

        [Column("ShippingAddressFirstName", TypeName = "nvarchar")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập tên người nhận hàng.")]
        public string ShippingAddressFirstName { get; set; } = string.Empty;

        [Column("ShippingAddressLastName", TypeName = "nvarchar")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập họ người nhận hàng.")]
        public string ShippingAddressLastName { get; set; } = string.Empty;

        [Column("ShippingAddressEmail", TypeName = "varchar")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ email người nhận hàng.")]
        [EmailAddress(ErrorMessage = "Địa chỉ email không hợp lệ.")]
        public string ShippingAddressEmail { get; set; } = string.Empty;

        [Column("ShippingAddressAddress", TypeName = "nvarchar")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ giao hàng.")]
        public string ShippingAddressAddress { get; set; } = string.Empty;

        [Column("ShippingAddressCity", TypeName = "nvarchar")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập thành phố giao hàng.")]
        public string ShippingAddressCity { get; set; } = string.Empty;

        [Column("ShippingAddressCountry", TypeName = "nvarchar")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập quốc gia giao hàng.")]
        public string ShippingAddressCountry { get; set; } = string.Empty;

        [Column("ShippingAddressZipCode", TypeName = "varchar")]
        [MaxLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập mã bưu điện giao hàng.")]
        public string ShippingAddressZipCode { get; set; } = string.Empty;

        [Column("ShippingAddressTelephone", TypeName = "varchar")]
        [MaxLength(50)]
        [Required(ErrorMessage = "Vui lòng nhập số điện thoại người nhận hàng.")]
        [Phone(ErrorMessage = "Số điện thoại không hợp lệ.")]
        public string ShippingAddressTelephone { get; set; } = string.Empty;

        [Column("OrderNote", TypeName = "ntext")]
        public string OrderNote { get; set; } = string.Empty;
    }
}
