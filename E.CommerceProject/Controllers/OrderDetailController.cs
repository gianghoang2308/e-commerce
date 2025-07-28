using E.CommerceProject.Models;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;
using X.PagedList.Extensions;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace E.CommerceProject.Controllers
{
    public class OrderDetailController : Controller
    {
        private readonly ApplicationDbContext _context;

        public OrderDetailController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index(int pageNumber =1)
        {
            if(pageNumber < 1)
            {
                pageNumber = 1;
            }
            var pageSize = 10;
            var pageList = _context.OrderDetails.OrderBy(o => o.Id).ToPagedList(pageNumber, pageSize);
            return View(pageList);
        }

        [HttpGet]
        public IActionResult Create()
        {
            List<Order> order = _context.Orders.ToList();
            ViewBag.CategoryList = order;
            List<Product> product = _context.Products.ToList();
            ViewBag.CategoryList = product;
            return View();
        }

        [HttpPost]
        public IActionResult Create(OrderDetail data)
        {
            List<Order> order = _context.Orders.ToList();
            ViewBag.CategoryList = order;
            List<Product> product = _context.Products.ToList();
            ViewBag.CategoryList = product;

            _context.OrderDetails.Add(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var orderDetail = _context.OrderDetails.Find(id);
            if (orderDetail == null)
            {
                return NotFound();
            }
            else
            {
                List<Order> order = _context.Orders.ToList();
                ViewBag.CategoryList = order;
                List<Product> product = _context.Products.ToList();
                ViewBag.CategoryList = product;

                return View(orderDetail);
            }
        }

        [HttpPost]
        public IActionResult Edit(OrderDetail data)
        {

            List<Order> order = _context.Orders.ToList();
            ViewBag.CategoryList = order;
            List<Product> product = _context.Products.ToList();
            ViewBag.CategoryList = product;

            _context.OrderDetails.Update(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        
        }

        [HttpGet]
        public IActionResult Delete(int id)
        {
            var orderDetail = _context.OrderDetails.Find(id);
            if (orderDetail == null)
            {
                return NotFound();
            }
            else
            {

                _context.OrderDetails.Remove(orderDetail);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
        }
    }
}
