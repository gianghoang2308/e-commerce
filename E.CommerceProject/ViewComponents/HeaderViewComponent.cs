
using E.CommerceProject.Models;
using E.CommerceProject.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace E.CommerceProject.ViewComponents
{

    public class HeaderViewComponent : ViewComponent
    {
        private readonly ApplicationDbContext _context;
        
        public HeaderViewComponent(ApplicationDbContext context)
        {
            _context = context;
        }
        public IViewComponentResult Invoke()
        {
            int countWishList = 0;
            var userIdClaim = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "id");
            if (userIdClaim != null)
            {
                int userId = int.Parse(userIdClaim.Value);
                countWishList = _context.WishLists.Count(w => w.UserId == userId);
            }

            ViewBag.WishListCount = countWishList;
            return View();
        }
    }

}
