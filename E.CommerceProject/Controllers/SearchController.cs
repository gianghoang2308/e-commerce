using E.CommerceProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace E.CommerceProject.Controllers
{
    public class SearchController : Controller
    {
        private readonly ApplicationDbContext _context;

        public SearchController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index(string searchTerm)
        {
            var model = new Search
            {
                SearchTerm = searchTerm,
                ProductList = new List<Product>(),
                BrandList = new List<Brand>()
            };

            if (string.IsNullOrWhiteSpace(searchTerm))
            {
                return View(model);
            }

     
            model.ProductList = _context.Products.Include(c => c.Category)
                .Where(p => EF.Functions.Like(p.Name, $"%{searchTerm}%") ||
                           (p.Description != null && EF.Functions.Like(p.Description, $"%{searchTerm}%")))
                .ToList();

          
            model.BrandList = _context.Brands
                .Where(b => EF.Functions.Like(b.BrandName, $"%{searchTerm}%") ||
                           (b.Description != null && EF.Functions.Like(b.Description, $"%{searchTerm}%")))
                .ToList();

            return View(model);
        }

        [HttpGet]
        public IActionResult ProductSearch(string searchTerm)
        {
            var model = new Search
            {
                SearchTerm = searchTerm,
                ProductList = new List<Product>(),
                BrandList = new List<Brand>()
            };

            if (string.IsNullOrWhiteSpace(searchTerm))
            {
                return View(model);
            }

            
            model.ProductList = _context.Products.Include(c => c.Category)
                .Where(p => EF.Functions.Like(p.Name, $"%{searchTerm}%") ||
                           (p.Description != null && EF.Functions.Like(p.Description, $"%{searchTerm}%")))
                .ToList();

            model.BrandList = _context.Brands
                .Where(b => EF.Functions.Like(b.BrandName, $"%{searchTerm}%") ||
                           (b.Description != null && EF.Functions.Like(b.Description, $"%{searchTerm}%")))
                .ToList();

            return View(model);
        }
    }
}
