using E.CommerceProject.Models;
using E.CommerceProject.ViewComponents;
using E.CommerceProject.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using X.PagedList;
using X.PagedList.Extensions;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;


namespace E.CommerceProject.Controllers
{
   
    public class ProductController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ProductController(ApplicationDbContext context)
        {
            _context = context;
        }

        [Authorize(AuthenticationSchemes = "AdminRole")]
        [HttpGet]
        public IActionResult Index(int pageNumber =1)
        {
            if(pageNumber < 1)
            {
                pageNumber = 1;
            }

            var pageSize = 10;
            var pageList = _context
                .Products.OrderBy(p=> p.Id)
                .Include(c =>c.Category)
                .Include(b => b.Brand)
                .Include(s =>s.Supplier)
                .Include(e => e.Color)
                .Include(a => a.AssembleIn)
                .ToPagedList(pageNumber, pageSize);
            return View(pageList);
        }

        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpGet]
        public IActionResult Detail(int id)
        {
            var product = _context.Products
                .Include(p => p.Category)
                .FirstOrDefault(p => p.Id == id);

            if (product == null)
            {
                return NotFound();
            }

            ViewBag.ProductId = id;
            ViewBag.CatName = product.Category?.Name;
            ViewBag.ProductName = product.Name;


            var productImages = _context.ProductImages
                .Where(p => p.ProductId == id)
                .ToList();
            ViewBag.ProductImages = productImages;


            var prdList = _context.Products
                .Include(p => p.Category)
                .Where(p => p.CategoryId == product.CategoryId && p.Id != id)
                .ToList();
            ViewBag.PrdList = prdList;
            ViewBag.ProductList = new List<Product> { product };

          
            ViewBag.ConfigList = _context.Configs.ToList();

            var totalComment = _context.Comments.Count(c => c.ProductId == id);
            ViewBag.TotalComment = totalComment;



            return View(product);
        }


        [Authorize(AuthenticationSchemes = "AdminRole")]
        [HttpGet]
        public IActionResult Create()
        {
            List<Category> cat = _context.Categories.ToList();
            ViewBag.CategoryList = cat;

            List<Brand> brand = _context.Brands.ToList();
            ViewBag.BrandList = brand;

            List<Supplier> supplier = _context.Suppliers.ToList();
            ViewBag.SupplierList = supplier;

            List<Color> color = _context.Colors.ToList();
            ViewBag.ColorList = color;

            List<AssembleIn> assembleIn = _context.AssembleIns.ToList();
            ViewBag.AssembleInList = assembleIn;

            return View();
        }

        [Authorize(AuthenticationSchemes = "AdminRole")]
        [HttpPost]  
        public IActionResult Create(Product data)
        {
            List<Category> cat = _context.Categories.ToList();
            ViewBag.CategoryList = cat;

            List<Brand> brand = _context.Brands.ToList();
            ViewBag.BrandList = brand;

            List<Supplier> supplier = _context.Suppliers.ToList();
            ViewBag.SupplierList = supplier;

            List<Color> color = _context.Colors.ToList();
            ViewBag.ColorList = color;

            List<AssembleIn> assembleIn = _context.AssembleIns.ToList();
            ViewBag.AssembleInList = assembleIn;

            data.CreateTime = DateTime.Now;
            data.UpdateTime = DateTime.Now;

            var file = Request.Form.Files.FirstOrDefault();
            if (file != null && file.Length > 0)
            {
                var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "images","products");

                if (!Directory.Exists(uploadsFolder))
                {
                    Directory.CreateDirectory(uploadsFolder);
                }

                var fileName = Path.GetFileName(file.FileName);
                var filePath = Path.Combine(uploadsFolder, fileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                data.MainImage = fileName;
            }
            _context.Products.Add(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [Authorize(AuthenticationSchemes = "AdminRole")]
        [HttpGet]
        public IActionResult Edit(int id)
        {
            var product = _context.Products.Find(id);
            if(product == null)
            {
                return NotFound();
            }
            else
            {
                List<Category> cat = _context.Categories.ToList();
                ViewBag.CategoryList = cat;

                List<Brand> brand = _context.Brands.ToList();
                ViewBag.BrandList = brand;

                List<Supplier> supplier = _context.Suppliers.ToList();
                ViewBag.SupplierList = supplier;

                List<Color> color = _context.Colors.ToList();
                ViewBag.ColorList = color;

                List<AssembleIn> assembleIn = _context.AssembleIns.ToList();
                ViewBag.AssembleInList = assembleIn;

                return View(product);
            }
        }

        [Authorize(AuthenticationSchemes = "AdminRole")]
        [HttpPost]
        public IActionResult Edit(Product data, string oldMainImage)
        {

            List<Category> cat = _context.Categories.ToList();
            ViewBag.CategoryList = cat;

            List<Brand> brand = _context.Brands.ToList();
            ViewBag.BrandList = brand;

            List<Supplier> supplier = _context.Suppliers.ToList();
            ViewBag.SupplierList = supplier;

            List<Color> color = _context.Colors.ToList();
            ViewBag.ColorList = color;

            List<AssembleIn> assembleIn = _context.AssembleIns.ToList();
            ViewBag.AssembleInList = assembleIn;

            var file = Request.Form.Files.FirstOrDefault();
            if (file != null && file.Length > 0)
            {
                var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "images","products");

                if (!Directory.Exists(uploadsFolder))
                {
                    Directory.CreateDirectory(uploadsFolder);
                }

                var fileName = Path.GetFileName(file.FileName);
                var filePath = Path.Combine(uploadsFolder, fileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                data.MainImage = fileName; 
            }
            else
            {
                data.MainImage = oldMainImage; 
            }
            _context.Products.Update(data);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }

        [Authorize(AuthenticationSchemes = "AdminRole")]
        [HttpGet]
        public IActionResult Delete(int id)
        {
            var product = _context.Products.Find(id);
            if (product != null)
            {
                _context.Products.Remove(product);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return NotFound();
            }
        }

        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpGet]
        public IActionResult AllProduct()
        {
            return View();
        }

        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpGet]
        public IActionResult SmartPhone(int pagenumber = 1, List<int> brand = null, decimal? minPrice = null, decimal? maxPrice = null)
        {
            var pageSize = 10;
            var query = _context.Products
                .Include(p => p.Category)
                .Where(p => p.CategoryId == 1);

            if (brand != null && brand.Any())
            {
                query = query.Where(p => p.BrandId != null && brand.Contains((int)p.BrandId));
            }

            if (minPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price >= minPrice.Value);
            }

            if (maxPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price <= maxPrice.Value);
            }

            var pageList = query.OrderByDescending(p => p.CreateTime).ToPagedList(pagenumber, pageSize);

            ViewBag.SelectedBrands = brand ?? new List<int>();

            // Đếm tổng các loại
            ViewBag.TotalSmartPhone = _context.Products.Count(p => p.CategoryId == 1);
            ViewBag.TotalTablet = _context.Products.Count(p => p.CategoryId == 2);
            ViewBag.TotalLaptop = _context.Products.Count(p => p.CategoryId == 7);
            ViewBag.TotalSmartWatch = _context.Products.Count(p => p.CategoryId == 8);
            ViewBag.TotalEarPhone = _context.Products.Count(p => p.CategoryId == 9);

            // Brand list
            var brandCounts = _context.Products
                .Where(p => p.BrandId != null && p.CategoryId == 1)
                .GroupBy(p => p.BrandId)
                .Select(g => new
                {
                    BrandId = g.Key,
                    ProductCount = g.Count(),
                    BrandName = _context.Brands.Where(b => b.Id == g.Key).Select(b => b.BrandName).FirstOrDefault()
                }).ToList();

            ViewBag.BrandList = brandCounts;

            // Top bán chạy
            ViewBag.SmartphoneList = _context.Products
                .Where(p => p.CategoryId == 1)
                .OrderByDescending(p => p.QuantityTotal)
                .Take(3).ToList();

            return View(pageList); 
        }


        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpGet]
        public IActionResult Tablet (int pagenumber = 1, List<int> brand = null, decimal? minPrice = null, decimal? maxPrice = null)
        {
            var pageSize = 10;
            var query = _context.Products
                .Include(p => p.Category)
                .Where(p => p.CategoryId == 2);

            if (brand != null && brand.Any())
            {
                query = query.Where(p => p.BrandId != null && brand.Contains((int)p.BrandId));
            }

            if (minPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price >= minPrice.Value);
            }

            if (maxPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price <= maxPrice.Value);
            }

            var pageList = query.OrderByDescending(p => p.CreateTime).ToPagedList(pagenumber, pageSize);

            ViewBag.SelectedBrands = brand ?? new List<int>();

            // Đếm tổng các loại
            ViewBag.TotalSmartPhone = _context.Products.Count(p => p.CategoryId == 1);
            ViewBag.TotalTablet = _context.Products.Count(p => p.CategoryId == 2);
            ViewBag.TotalLaptop = _context.Products.Count(p => p.CategoryId == 7);
            ViewBag.TotalSmartWatch = _context.Products.Count(p => p.CategoryId == 8);
            ViewBag.TotalEarPhone = _context.Products.Count(p => p.CategoryId == 9);

            // Brand list
            var brandCounts = _context.Products
                .Where(p => p.BrandId != null && p.CategoryId == 2)
                .GroupBy(p => p.BrandId)
                .Select(g => new
                {
                    BrandId = g.Key,
                    ProductCount = g.Count(),
                    BrandName = _context.Brands.Where(b => b.Id == g.Key).Select(b => b.BrandName).FirstOrDefault()
                }).ToList();

            ViewBag.BrandList = brandCounts;

            // Top bán chạy
            ViewBag.TabletList = _context.Products
                .Where(p => p.CategoryId == 2)
                .OrderByDescending(p => p.QuantityTotal)
                .Take(3).ToList();

            return View(pageList);
        }

        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpGet]
        public IActionResult Laptop(int pagenumber = 1, List<int> brand = null, decimal? minPrice = null, decimal? maxPrice = null)
        {
            var pageSize = 10;
            var query = _context.Products
                .Include(p => p.Category)
                .Where(p => p.CategoryId == 7);

            if (brand != null && brand.Any())
            {
                query = query.Where(p => p.BrandId != null && brand.Contains((int)p.BrandId));
            }

            if (minPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price >= minPrice.Value);
            }

            if (maxPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price <= maxPrice.Value);
            }

            var pageList = query.OrderByDescending(p => p.CreateTime).ToPagedList(pagenumber, pageSize);

            ViewBag.SelectedBrands = brand ?? new List<int>();

            // Đếm tổng các loại
            ViewBag.TotalSmartPhone = _context.Products.Count(p => p.CategoryId == 1);
            ViewBag.TotalTablet = _context.Products.Count(p => p.CategoryId == 2);
            ViewBag.TotalLaptop = _context.Products.Count(p => p.CategoryId == 7);
            ViewBag.TotalSmartWatch = _context.Products.Count(p => p.CategoryId == 8);
            ViewBag.TotalEarPhone = _context.Products.Count(p => p.CategoryId == 9);

            // Brand list
            var brandCounts = _context.Products
                .Where(p => p.BrandId != null && p.CategoryId == 7)
                .GroupBy(p => p.BrandId)
                .Select(g => new
                {
                    BrandId = g.Key,
                    ProductCount = g.Count(),
                    BrandName = _context.Brands.Where(b => b.Id == g.Key).Select(b => b.BrandName).FirstOrDefault()
                }).ToList();

            ViewBag.BrandList = brandCounts;

            // Top bán chạy
            ViewBag.LaptopList = _context.Products
                .Where(p => p.CategoryId == 7)
                .OrderByDescending(p => p.QuantityTotal)
                .Take(3).ToList();

            return View(pageList);
        }

        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpGet]
        public IActionResult SmartWatch(int pagenumber = 1, List<int> brand = null, decimal? minPrice = null, decimal? maxPrice = null)
        {
            var pageSize = 10;
            var query = _context.Products
                .Include(p => p.Category)
                .Where(p => p.CategoryId == 8);

            if (brand != null && brand.Any())
            {
                query = query.Where(p => p.BrandId != null && brand.Contains((int)p.BrandId));
            }

            if (minPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price >= minPrice.Value);
            }

            if (maxPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price <= maxPrice.Value);
            }

            var pageList = query.OrderByDescending(p => p.CreateTime).ToPagedList(pagenumber, pageSize);

            ViewBag.SelectedBrands = brand ?? new List<int>();

            // Đếm tổng các loại
            ViewBag.TotalSmartPhone = _context.Products.Count(p => p.CategoryId == 1);
            ViewBag.TotalTablet = _context.Products.Count(p => p.CategoryId == 2);
            ViewBag.TotalLaptop = _context.Products.Count(p => p.CategoryId == 7);
            ViewBag.TotalSmartWatch = _context.Products.Count(p => p.CategoryId == 8);
            ViewBag.TotalEarPhone = _context.Products.Count(p => p.CategoryId == 9);

            // Brand list
            var brandCounts = _context.Products
                .Where(p => p.BrandId != null && p.CategoryId == 8)
                .GroupBy(p => p.BrandId)
                .Select(g => new
                {
                    BrandId = g.Key,
                    ProductCount = g.Count(),
                    BrandName = _context.Brands.Where(b => b.Id == g.Key).Select(b => b.BrandName).FirstOrDefault()
                }).ToList();

            ViewBag.BrandList = brandCounts;

            // Top bán chạy
            ViewBag.SmartphoneList = _context.Products
                .Where(p => p.CategoryId == 8)
                .OrderByDescending(p => p.QuantityTotal)
                .Take(3).ToList();

            return View(pageList);
        }

        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpGet]
        public IActionResult EarPhone(int pagenumber = 1, List<int> brand = null, decimal? minPrice = null, decimal? maxPrice = null)
        {
            var pageSize = 10;
            var query = _context.Products
                .Include(p => p.Category)
                .Where(p => p.CategoryId == 9);

            if (brand != null && brand.Any())
            {
                query = query.Where(p => p.BrandId != null && brand.Contains((int)p.BrandId));
            }

            if (minPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price >= minPrice.Value);
            }

            if (maxPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price <= maxPrice.Value);
            }

            var pageList = query.OrderByDescending(p => p.CreateTime).ToPagedList(pagenumber, pageSize);

            ViewBag.SelectedBrands = brand ?? new List<int>();

            // Đếm tổng các loại
            ViewBag.TotalSmartPhone = _context.Products.Count(p => p.CategoryId == 1);
            ViewBag.TotalTablet = _context.Products.Count(p => p.CategoryId == 2);
            ViewBag.TotalLaptop = _context.Products.Count(p => p.CategoryId == 7);
            ViewBag.TotalSmartWatch = _context.Products.Count(p => p.CategoryId == 8);
            ViewBag.TotalEarPhone = _context.Products.Count(p => p.CategoryId == 9);

            // Brand list
            var brandCounts = _context.Products
                .Where(p => p.BrandId != null && p.CategoryId == 9)
                .GroupBy(p => p.BrandId)
                .Select(g => new
                {
                    BrandId = g.Key,
                    ProductCount = g.Count(),
                    BrandName = _context.Brands.Where(b => b.Id == g.Key).Select(b => b.BrandName).FirstOrDefault()
                }).ToList();

            ViewBag.BrandList = brandCounts;

            // Top bán chạy
            ViewBag.SmartphoneList = _context.Products
                .Where(p => p.CategoryId == 9)
                .OrderByDescending(p => p.QuantityTotal)
                .Take(3).ToList();

            return View(pageList);
        }

        [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
        [HttpGet]
        public IActionResult HotDeal(int pagenumber = 1, List<int> brand = null, decimal? minPrice = null, decimal? maxPrice = null)
        {
            var pageSize = 10;
            var query = _context.Products
                .Include(p => p.Category)
                .Where(p => p.SalePrice > 0);

            // Đếm tổng các loại
            ViewBag.TotalSmartPhone = _context.Products.Count(p => p.CategoryId == 1);
            ViewBag.TotalTablet = _context.Products.Count(p => p.CategoryId == 2);
            ViewBag.TotalLaptop = _context.Products.Count(p => p.CategoryId == 7);
            ViewBag.TotalSmartWatch = _context.Products.Count(p => p.CategoryId == 8);
            ViewBag.TotalEarPhone = _context.Products.Count(p => p.CategoryId == 9);
            ViewBag.TotalProduct = _context.Products.OrderByDescending(p => p.SalePrice).Count(p => p.QuantityTotal > 0);

            if (brand != null && brand.Any())
            {
                query = query.Where(p => p.BrandId != null && brand.Contains((int)p.BrandId));
            }
            if (minPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price >= minPrice.Value);
            }

            if (maxPrice.HasValue)
            {
                query = query.Where(p => (decimal)p.Price <= maxPrice.Value);
            }

            var pageList = query.OrderByDescending(p => p.CreateTime).ToPagedList(pagenumber, pageSize);

            ViewBag.SelectedBrands = brand ?? new List<int>();
            ViewBag.MinPrice = minPrice;
            ViewBag.MaxPrice = maxPrice;

            // Brand list
            var brandCounts = _context.Products
                .Where(p => p.BrandId != null && p.SalePrice > 0)
                .GroupBy(p => p.BrandId)
                .Select(g => new
                {
                    BrandId = g.Key,
                    ProductCount = g.Count(),
                    BrandName = _context.Brands.Where(b => b.Id == g.Key).Select(b => b.BrandName).FirstOrDefault()
                }).ToList();

            ViewBag.BrandList = brandCounts;

            // Top bán chạy
            ViewBag.SmartphoneList = _context.Products
             .Where(p => p.SalePrice > 0)
             .Include(p => p.Category)  // Include Category
             .Include(p => p.Brand)     // Include Brand if needed
             .OrderByDescending(p => p.QuantityTotal)
             .Take(3)                   // Add Take(3) to limit to 3 items
             .ToList();

            return View(pageList);
        }

        [HttpGet]
        public IActionResult LoadReviews(int productId, int pageNumber = 1)
        {
            return ViewComponent("Reviews", new { productId, pageNumber });
        }


        [HttpPost]
        [Authorize(AuthenticationSchemes = "UserRole")]
        public IActionResult AddToCompare(int ProductId)
        {
            string sessionKey = "CompareProduct1";
            var firstId = HttpContext.Session.GetInt32(sessionKey);

            if (firstId == null)
            {
                HttpContext.Session.SetInt32(sessionKey, ProductId);
                TempData["CompareMessage"] = "Đã chọn sản phẩm đầu tiên. Bạn có thể xem hoặc chọn thêm sản phẩm.";

                // 👉 Điều chỉnh: Redirect đến Compare mà không cần id1 (nó sẽ đọc từ Session)
                return RedirectToAction("Compare");
            }
            else
            {
                HttpContext.Session.Remove(sessionKey);
                return RedirectToAction("Compare", new { id1 = firstId.Value, id2 = ProductId });
            }
        }


        [HttpGet]
        [Authorize(AuthenticationSchemes = "UserRole")]
        public IActionResult Compare(int? id1, int? id2)
        {
            // 🔧 Nếu id1 không truyền vào, thì lấy từ session
            if (id1 == null)
            {
                id1 = HttpContext.Session.GetInt32("CompareProduct1");
            }

            // ❗Nếu vẫn không có thì return NotFound
            if (id1 == null)
                return NotFound("Không có sản phẩm nào để so sánh.");

            var product1 = _context.Products
                .Include(p => p.Category)
                .Include(p => p.Brand)
                .Include(p => p.Supplier)
                .FirstOrDefault(p => p.Id == id1.Value);

            Product? product2 = null;
            if (id2 != null)
            {
                product2 = _context.Products
                    .Include(p => p.Category)
                    .Include(p => p.Brand)
                    .Include(p => p.Supplier)
                    .FirstOrDefault(p => p.Id == id2.Value);
            }

            if (product1 == null)
                return NotFound("Không tìm thấy sản phẩm đầu tiên.");

            return View(new CompareProductViewModel
            {
                Product1 = product1,
                Product2 = product2
            });
        }

        [HttpPost]
        [Authorize(AuthenticationSchemes = "UserRole")]
        public IActionResult RemoveCompare(int id)
        {
            int? sessionId = HttpContext.Session.GetInt32("CompareProduct1");

            if (sessionId != null && sessionId == id)
            {
                HttpContext.Session.Remove("CompareProduct1");
                TempData["CompareMessage"] = "Đã xoá sản phẩm khỏi danh sách so sánh.";

                return RedirectToAction("Compare", new { id1 = (int?)null });
            }

            TempData["CompareMessage"] = "Đã xoá sản phẩm khỏi danh sách so sánh.";

            var id1 = HttpContext.Session.GetInt32("CompareProduct1");

            if (id1 == null)
                return RedirectToAction("Index", "Home"); 

            return RedirectToAction("Compare", new { id1 });
        }




    }
}




