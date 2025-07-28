using E.CommerceProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using X.PagedList;
using X.PagedList.Extensions;

namespace E.CommerceProject.Controllers
{
   
    public class CommentController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CommentController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index(int pageNumber = 1)
        {
            if (pageNumber < 1)
            {
                pageNumber = 1;
            }

            int pageSize = 10;
            var pageList = _context.Comments
                .OrderBy(c => c.Id)
                .Include(c => c.Product)
                .Include(c => c.User)
                .ToPagedList(pageNumber, pageSize);

            return View(pageList);
        }

        [HttpGet]
        public IActionResult Detail(int id)
        {
            var comment = _context.Comments
                .Include(c => c.Product)
                .Include(c => c.User)
                .FirstOrDefault(c => c.Id == id);

            if (comment == null)
                return NotFound();

            return View(comment);
        }

        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpGet]
        public IActionResult Create(int productId)
        {
            var product = _context.Products.Find(productId);
            if (product == null)
                return NotFound("Sản phẩm không tồn tại.");

            var userIdClaim = User.Claims.FirstOrDefault(c => c.Type == "id");
            if (userIdClaim == null)
                return Unauthorized(); // Chưa đăng nhập

            int userId = int.Parse(userIdClaim.Value);
            var user = _context.Users.Find(userId);
            if (user == null)
                return Unauthorized();

            var comment = new Comment
            {
                ProductId = productId,
                UserId = userId,
                FullName = user.FullName,
                Email = user.Email
            };

            ViewBag.Product = product;
            return View(comment);
        }

        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpPost]
        public IActionResult Create(Comment data)
        {
           
            var userIdClaim = User.Claims.FirstOrDefault(c => c.Type == "id");
            if (userIdClaim == null)
                return Unauthorized();

            data.UserId = int.Parse(userIdClaim.Value);
            data.FullName = User.Claims.FirstOrDefault(c => c.Type == "fullname")?.Value ?? "";
            data.Email = User.Claims.FirstOrDefault(c => c.Type == "email")?.Value ?? "";
            data.CreateTime = DateTime.Now;

            _context.Comments.Add(data);
            _context.SaveChanges();

            return RedirectToAction("Detail", "Product", new { id = data.ProductId });
        }



        [HttpGet]
        public IActionResult Edit(int id)
        {
            var comment = _context.Comments.Find(id);
            if (comment == null)
                return NotFound();

            var product = _context.Products.Find(comment.ProductId);
            ViewBag.Product = product;

            return View(comment);
        }

        [HttpPost]
        public IActionResult Edit(Comment data)
        {
            if (!ModelState.IsValid)
            {
                var product = _context.Products.Find(data.ProductId);
                ViewBag.Product = product;
                return View(data);
            }

            _context.Comments.Update(data);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult Delete(int id)
        {
            var comment = _context.Comments.Find(id);
            if (comment == null)
                return NotFound();

            _context.Comments.Remove(comment);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}
