using E.CommerceProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;
using X.PagedList.Extensions;

namespace E.CommerceProject.Controllers
{
    [Authorize(AuthenticationSchemes = "AdminRole")]
    public class ColorController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ColorController(ApplicationDbContext context)
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
            var pageList = _context.Colors.OrderBy(c => c.Id).ToPagedList(pageNumber, pageSize);
            
            return View(pageList);
        }

        [HttpGet]
        public IActionResult Detail(int id)
        {
            var color = _context.Colors.Find(id);
            if(color == null)
            {
                return NotFound();
            }
            else
            {
                return View(color);
            }
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Color data)
        {
            _context.Colors.Add(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var color = _context.Colors.Find(id);
            if (color == null)
            {
                return NotFound();
            }
            else
            {
                return View(color);
            }
        }

        [HttpPost]
        public IActionResult Edit(Color data)
        {
            _context.Colors.Update(data);
            _context.SaveChanges();
            return RedirectToAction("Index");

        }

        [HttpGet]
        public IActionResult Delete(int id)
        {
            var category = _context.Categories.Find(id);
            if(category == null)
            {
                return NotFound();
            }
            else
            {
                _context.Remove(category);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
        }
    }
}
