namespace E.CommerceProject.Models
{
    public class CartItem
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public string MainImage { get; set; }

        public float Price { get; set; }          
        public float SalePrice { get; set; }     

        public int Quantity { get; set; }

        public float FinalPrice => Price * (1 - SalePrice); 

        public float TotalPrice => FinalPrice * Quantity;
    }
}
