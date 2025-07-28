using E.CommerceProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;
using X.PagedList.Extensions;

namespace E.CommerceProject.Controllers
{
    [Authorize(AuthenticationSchemes = "AdminRole")]
    public class ConfigController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ConfigController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index(int pageNumber = 1)
        {
            if(pageNumber < 1)
            {
                pageNumber = 1;
            }

            var pageSize = 10;
            var pageList = _context.Configs.OrderBy(c => c.Id).ToPagedList(pageNumber, pageSize);
            return View(pageList);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Config data)
        {
            _context.Configs.Add(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var config = _context.Configs.Find(id);
            if (config == null)
            {
                return NotFound();
            }
            else
            {
                return View(config);
            }
        }

        [HttpPost]
        public IActionResult Edit(Config data)
        {
            _context.Configs.Update(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Delete(int id)
        {
            var config = _context.Configs.Find(id);
            if (config == null)
            {
                return NotFound();
            }
            else
            {
                _context.Configs.Remove(config);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
        }
    }
}
