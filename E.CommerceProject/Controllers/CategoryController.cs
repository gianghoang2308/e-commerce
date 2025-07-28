using E.CommerceProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;
using X.PagedList.Extensions;

namespace E.CommerceProject.Controllers
{
    [Authorize(AuthenticationSchemes = "AdminRole")]
    public class CategoryController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CategoryController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index(int pageNumber = 1)
        {
            if(pageNumber <= 1)
            {
                pageNumber = 1;
            }

            var pageSize = 10;
            var pageList =_context.Categories.OrderBy(c => c.Id).ToPagedList(pageNumber, pageSize);
            return View(pageList);
        }

        [HttpGet]
        public IActionResult Detail(int id)
        {
            var category = _context.Categories.Find(id);    
            if(category == null)
            {
                return NotFound();
            }
            else
            {
                return View(category);
            }
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Category data)
        {   
            data.CreatedDate = DateTime.Now;
            data.UpdatedDate = DateTime.Now;
            _context.Categories.Add(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var category = _context.Categories.Find(id);
            if(category == null)
            {
                return NotFound();
            }
            else
            {
                return View(category);
            }
        }

        [HttpPost]
        public IActionResult Edit(Category data)
        {
            data.UpdatedDate = DateTime.Now;
            _context.Categories.Update(data);
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
