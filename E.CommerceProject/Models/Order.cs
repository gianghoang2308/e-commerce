using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("Order")]
    public class Order
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [ForeignKey("User")]
        public int UserId { get; set; }

        [Required]
        public DateTime OrderDate { get; set; } = DateTime.Now;

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250)]
        [Required]
        public string PaymentMethod { get; set; } = string.Empty;

        [Required]
        public float TotalAmount { get; set; }

        [Required]
        public float ShippingFee { get; set; }

        [Required]
        public bool IsTermsAccepted { get; set; }

        public virtual User User { get; set; }
    }
}
