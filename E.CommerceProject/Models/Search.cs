using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace E.CommerceProject.Models
{
    public class Search
    {
        public List<Product>? ProductList { get; set; }
        public List<Brand>? BrandList { get; set; }
        public string? SearchTerm { get; set; }

        public bool HasResults =>
           ProductList.Any() || BrandList.Any();
    }
}
