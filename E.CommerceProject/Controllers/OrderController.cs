
using E.CommerceProject.Models;
using E.CommerceProject.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace E.CommerceProject.Controllers
{
    public class OrderController : Controller
    {
        private readonly ApplicationDbContext _context;

        public OrderController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var orders = _context.Orders.Include(o => o.User).ToList();
            return View(orders);
        }

        public IActionResult Create()
        {
            ViewBag.Products = _context.Products.ToList();
            ViewBag.Users = _context.Users.ToList();
            return View();
        }

        [HttpPost]
        public IActionResult Create(Order data )
        { 
            return RedirectToAction("Index");
        }

        public IActionResult Details(int id)
        {
            var order = _context.Orders.Include(o => o.User)
                                       .FirstOrDefault(o => o.Id == id);
            var details = _context.OrderDetails.Include(od => od.Product)
                                               .Where(od => od.OrderId == id)
                                               .ToList();

            ViewBag.OrderDetails = details;
            return View(order);
        }
    }
}