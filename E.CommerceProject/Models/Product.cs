using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("Product")]
    public class Product
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "nvarchar(250)")]
        [MaxLength(250)]
        [Required(ErrorMessage ="Tên sản phẩm không được để trống")]
        public string Name { get; set; } =string.Empty;


        [Required(ErrorMessage ="Ảnh sản phẩm không được để trống")]
        public string MainImage { get; set; }

        [Required(ErrorMessage = "Giá sản phẩm không được để trống")]
        public float Price { get; set; }

        [Required(ErrorMessage = "Giá khuyến mãi không được để trống")]
        public float SalePrice { get; set; } = 0; 

        [Column(TypeName = "ntext")]
        [Required(ErrorMessage = "Mô tả sản phẩm không được để trống")]
        public string Description { get; set; } =string.Empty;

        [Required]
        public bool Status { get; set; } = true; 
        [Required]
        public int CategoryId { get; set; }

        [Required]
        public int BrandId { get; set; }

        [Required]
        public int SupplierId { get; set; }

        [Required]
        public int ColorId { get; set; }

        [Required]
        public int AssembleInId { get; set; }

        [Required]
        public DateTime CreateTime { get; set; } = DateTime.Now;

        [Required]
        public DateTime UpdateTime { get; set; }

        [Required]
        public int QuantityTotal { get; set; }

        public virtual Category Category { get; set; }

        public virtual Brand Brand { get; set; }

        public virtual Supplier Supplier { get; set; }

        public virtual Color Color { get; set; }

        public virtual AssembleIn AssembleIn { get; set; }
 

        public ICollection<ProductImage> ProductImages { get; set; } = new List<ProductImage>();

        public ICollection<WishList> WishLists { get; set; } = new List<WishList>();

        public ICollection<Comment> Comments { get; set; } = new List<Comment>();

        public ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

    }
}
