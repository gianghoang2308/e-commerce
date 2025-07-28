using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("OrderDetail")]
    public class OrderDetail
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [ForeignKey("Order")]
        public int OrderId { get; set; }

        [Required]
        [ForeignKey("Product")]
        public int ProductId { get; set; }
      
        [Required]
        public int Quantity { get; set; } 
        [Required]
        public float UnitPrice { get; set; } 

        [Required]
        public float TotalPrice { get; set; } 
        public void CalculateTotalPrice()
        {
            TotalPrice = Quantity * UnitPrice;
        }
        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
