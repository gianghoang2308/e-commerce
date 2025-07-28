using E.CommerceProject.Models;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using X.PagedList;

using X.PagedList.Extensions;

namespace E.CommerceProject.ViewComponents
{
    public class ReviewsViewComponent : ViewComponent
    {
        private readonly ApplicationDbContext _context;

        public ReviewsViewComponent(ApplicationDbContext context)
        {
            _context = context;
        }

        public IViewComponentResult Invoke(int productId, int pageNumber = 1)
        {
            var pageSize = 3;
            if (pageNumber < 1)
            {
                pageNumber = 1;
            }

            var pageList = _context.Comments
                .Where(c => c.ProductId == productId)
                .OrderByDescending(c => c.CreateTime)
                .ToPagedList(pageNumber, pageSize);

            ViewBag.ProductId = productId;

            return View(pageList);
        }

    }
}
