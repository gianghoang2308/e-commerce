// ViewComponents/RatingViewComponent.cs
using E.CommerceProject.Models;
using E.CommerceProject.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
namespace E.CommerceProject.ViewComponents
{
    public class RatingViewComponent : ViewComponent
    {
        private readonly ApplicationDbContext _context;

        public RatingViewComponent(ApplicationDbContext context)
        {
            _context = context;
        }

        public IViewComponentResult Invoke(int productId)
        {
            var ratings = _context.Comments
                .Where(c => c.ProductId == productId)
                .ToList();

            var ratingCounts = Enumerable.Range(1, 5)
                .Select(star => new RatingCountViewModel
                {
                    Stars = star,
                    Count = ratings.Count(r => r.Rate == star)
                })
                .OrderByDescending(x => x.Stars)
                .ToList();

            return View(ratingCounts);
        }
    }
}
