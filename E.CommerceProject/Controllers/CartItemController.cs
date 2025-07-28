using E.CommerceProject.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace E.CommerceProject.Controllers
{
    public class CartController : Controller
    {
        private const string CART_KEY = "Cart";
        private readonly ApplicationDbContext _context;

        public CartController(ApplicationDbContext context)
        {
            _context = context;
        }

        // Lấy giỏ hàng từ session
        private List<CartItem> GetCart()
        {
            var sessionData = HttpContext.Session.GetString(CART_KEY);
            return sessionData != null
                ? JsonConvert.DeserializeObject<List<CartItem>>(sessionData)
                : new List<CartItem>();
        }

        // Lưu giỏ hàng vào session
        private void SaveCart(List<CartItem> cart)
        {
            HttpContext.Session.SetString(CART_KEY, JsonConvert.SerializeObject(cart));
        }

        // Hiển thị giỏ hàng
        public IActionResult Index()
        {
            var cart = GetCart();
            return View(cart);
        }

        // Hiển thị form thêm vào giỏ hàng (nếu cần)
        [HttpGet]
        public IActionResult AddToCart(int id)
        {
            var product = _context.Products.Find(id);
            if (product == null)
                return NotFound();

            return View(product); // Truyền model Product sang View
        }

        // Xử lý thêm vào giỏ hàng sau khi submit form
        [HttpPost]
        public IActionResult AddToCart(int productId, int quantity)
        {
            var product = _context.Products.FirstOrDefault(p => p.Id == productId);
            if (product == null)
                return NotFound();

            var cart = GetCart();
            var existingItem = cart.FirstOrDefault(c => c.ProductId == productId);

            // Tính phần trăm giảm giá
            float salePercent = 0;
            if (product.SalePrice > 0 && product.SalePrice < product.Price)
            {
                salePercent = (product.Price - product.SalePrice) / product.Price;
            }

            if (existingItem != null)
            {
                existingItem.Quantity += quantity;
            }
            else
            {
                cart.Add(new CartItem
                {
                    ProductId = product.Id,
                    Name = product.Name,
                    MainImage = product.MainImage,
                    Price = product.Price,
                    SalePrice = product.SalePrice, // tỷ lệ giảm
                    Quantity = quantity
                });
            }

            SaveCart(cart);
            return RedirectToAction("Index");
        }


        // Xoá một sản phẩm khỏi giỏ
        public IActionResult RemoveFromCart(int id)
        {
            var cart = GetCart();
            var item = cart.FirstOrDefault(c => c.ProductId == id);
            if (item != null)
            {
                cart.Remove(item);
                SaveCart(cart);
            }
            return RedirectToAction("Index");
        }

        // Xoá toàn bộ giỏ hàng
        public IActionResult ClearCart()
        {
            SaveCart(new List<CartItem>());
            return RedirectToAction("Index");
        }
    }
}
