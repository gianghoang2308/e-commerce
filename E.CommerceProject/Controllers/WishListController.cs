using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using E.CommerceProject.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Authorization;

namespace E.CommerceProject.Controllers
{
    public class WishListController : Controller
    {
        private readonly ApplicationDbContext _context;

        public WishListController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: hiển thị form (nếu cần)
        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpGet]
        public IActionResult Create(int id)
        {
            var product = _context.Products.FirstOrDefault(p => p.Id == id);
            if (product == null)
                return NotFound("Sản phẩm không tồn tại.");

            var userIdClaim = User.Claims.FirstOrDefault(c => c.Type == "id");
            if (userIdClaim == null)
                return Unauthorized(); // Chưa đăng nhập

            int userId = int.Parse(userIdClaim.Value);

            var wishlist = new WishList
            {
                ProductId = id,
                UserId = userId,
                CreateTime = DateTime.Now
            };

            ViewBag.Product = product;
            return View(wishlist);
        }



        // POST: thêm vào DB
        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpPost]
        public IActionResult Create(WishList data)
        {
            var product = _context.Products.Find(data.ProductId);
            if (product == null)
                return NotFound("Sản phẩm không tồn tại.");

            var userIdClaim = User.Claims.FirstOrDefault(c => c.Type == "id");
            if (userIdClaim == null)
                return Unauthorized();

            data.UserId = int.Parse(userIdClaim.Value);
            data.CreateTime = DateTime.Now;

            // Kiểm tra đã có chưa
            var exists = _context.WishLists.Any(w => w.ProductId == data.ProductId && w.UserId == data.UserId);
            if (!exists)
            {
                _context.WishLists.Add(data);
                _context.SaveChanges();
            }

            return RedirectToAction("ViewWishList", new { userId = data.UserId });
        }



        [Authorize(AuthenticationSchemes = "UserRole")]
        // GET: WishList/ViewWishList?userId=1
        public IActionResult ViewWishList(int userId)
        {
            var wishList = _context.WishLists
                .Include(w => w.Product)
                .ThenInclude(p => p.Category)
                .Where(w => w.UserId == userId)
                .ToList();

            return View(wishList);
        }

        [Authorize(AuthenticationSchemes = "UserRole")]
        public IActionResult Delete(int id)
        {
            var userIdClaim = User.Claims.FirstOrDefault(c => c.Type == "id");
            if (userIdClaim == null)
            {
                return RedirectToAction("Login", "User");
            }

            int userId = int.Parse(userIdClaim.Value);

            var wishList = _context.WishLists
                .FirstOrDefault(w => w.ProductId == id && w.UserId == userId);

            if (wishList == null)
            {
                return NotFound();
            }

            _context.WishLists.Remove(wishList);
            _context.SaveChanges();

            return RedirectToAction("ViewWishList", new { userId = userId });
        }



    }
}