using System.Diagnostics;
using E.CommerceProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace E.CommerceProject.Controllers
{
    
    public class HomeController : Controller
    {
        
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [AllowAnonymous]
        [Authorize(AuthenticationSchemes = "UserRole")]
        public IActionResult Index()
        {
            if (TempData["SuccessMessage"] != null)
            {
                ViewBag.SuccessMessage = TempData["SuccessMessage"];
            }

            //loc san pham moi nhat
            var smartphone = _context.Products.Where(c => c.CategoryId == 1).Include(p => p.Category).OrderByDescending(p => p.CreateTime).Take(1).ToList(); //dien thoai di dong
            ViewBag.Smartphones = smartphone;
            var tablet = _context.Products.Where(c => c.CategoryId == 2).Include(p => p.Category).OrderByDescending(p => p.CreateTime).Take(1).ToList(); //may tinh bang
            ViewBag.Tablets = tablet;
            var laptop = _context.Products.Where(c => c.CategoryId == 7).Include(p => p.Category).OrderByDescending(p => p.CreateTime).Take(1).ToList(); //laptop
            ViewBag.Laptops = laptop;
            var smartwatch = _context.Products.Where(c => c.CategoryId == 8).Include(p => p.Category).OrderByDescending(p => p.CreateTime).Take(1).ToList(); //dong ho thong minh
            ViewBag.Smartwatches = smartwatch;
            var earphone = _context.Products.Where(c => c.CategoryId == 9).Include(p => p.Category).OrderByDescending(p => p.CreateTime).Take(1).ToList(); //tai nghe
            ViewBag.Earphones = earphone;

            //loc san pham theo gia tot nhat -  gia sale tang dan
            var smartphonePrice = _context.Products.Where(c => c.CategoryId == 1).Include(p => p.Category).OrderBy(p => p.SalePrice).Take(1).ToList(); //dien thoai di dong
            ViewBag.SmartphonePrice = smartphonePrice;
            var tabletPrice = _context.Products.Where(c => c.CategoryId == 2).Include(p => p.Category).OrderBy(p => p.SalePrice).Take(1).ToList(); //may tinh bang
            ViewBag.TabletPrice = tabletPrice;
            var laptopPrice = _context.Products.Where(c => c.CategoryId == 7).Include(p => p.Category).OrderBy(p => p.SalePrice).Take(1).ToList(); //laptop
            ViewBag.LaptopPrice = laptopPrice;
            var smartwatchPrice = _context.Products.Where(c => c.CategoryId == 8).Include(p => p.Category).OrderBy(p => p.SalePrice).Take(1).ToList(); //dong ho thong minh
            ViewBag.SmartwatchPrice = smartwatchPrice;
            var earphonePrice = _context.Products.Where(c => c.CategoryId == 9).Include(p => p.Category).OrderBy(p => p.SalePrice).Take(1).ToList(); //tai nghe
            ViewBag.EarphonePrice = earphonePrice;

            //loc san pham ban chay nhat -  tam theo loc theo so luong nhap vao
            var smartphoneSell = _context.Products.Where(c => c.CategoryId == 1).Include(p => p.Category).OrderByDescending(p => p.QuantityTotal).Take(3).ToList(); //dien thoai di dong
            ViewBag.SmartphoneList = smartphoneSell;
            var tabletSell = _context.Products.Where(c => c.CategoryId == 2).Include(p => p.Category).OrderBy(p => p.SalePrice).Take(3).ToList(); //may tinh bang
            ViewBag.TabletList = tabletSell;
            var laptopSell = _context.Products.Where(c => c.CategoryId == 7).Include(p => p.Category).OrderBy(p => p.SalePrice).Take(3).ToList(); //laptop
            ViewBag.LaptopList = laptopSell;
            var smartwatchSell = _context.Products.Where(c => c.CategoryId == 8).Include(p => p.Category).OrderBy(p => p.SalePrice).Take(3).ToList(); //dong ho thong minh
            ViewBag.SmartwatchList = smartwatchSell;
            var earphoneSell = _context.Products.Where(c => c.CategoryId == 9).Include(p => p.Category).OrderBy(p => p.SalePrice).Take(3).ToList(); //tai nghe
            ViewBag.EarphoneList = earphoneSell;
            //config social media
            List<Config> configs = _context.Configs.ToList();
            ViewBag.Configs = configs;

            return View();
        }

        [AllowAnonymous]
        [HttpGet]
        public IActionResult Contact()
        {
            List<Config> configs = _context.Configs.ToList();
            ViewBag.Configs = configs;

            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult Contact(Contact data)
        {
            List<Config> configs = _context.Configs.ToList();
            ViewBag.Configs = configs;

            _context.Contacts.Add(data);
            _context.SaveChanges();

            TempData["Message"] = "Gửi tin nhắn thành công!";

            return RedirectToAction("Contact","Home");
        }

        [HttpGet]
        public IActionResult About()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
