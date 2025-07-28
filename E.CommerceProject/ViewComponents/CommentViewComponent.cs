using E.CommerceProject.Models;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace E.CommerceProject.ViewComponents
{
    public class CommentViewComponent : ViewComponent
    {
        private readonly ApplicationDbContext _context;

        public CommentViewComponent(ApplicationDbContext context)
        {
            _context = context;
        }

        public IViewComponentResult Invoke(int productId)
        {
            var product = _context.Products.Find(productId);
            if (product == null)
                return View("Error");

            var comment = new Comment
            {
                ProductId = productId
            };

            var user = User as ClaimsPrincipal;
            if (user != null && user.Identity.IsAuthenticated)
            {
                comment.FullName = user.Claims.FirstOrDefault(c => c.Type == "fullname")?.Value ?? "";
                comment.Email = user.Claims.FirstOrDefault(c => c.Type == "email")?.Value ?? "";
                comment.UserId = int.Parse(user.Claims.FirstOrDefault(c => c.Type == "id")?.Value ?? "0");
            }

            ViewBag.Product = product;

            return View(comment); // return partial view with model = Comment
        }
    }
}
