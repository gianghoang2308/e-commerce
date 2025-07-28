using E.CommerceProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;
using X.PagedList.Extensions;

namespace E.CommerceProject.Controllers
{
    [Authorize(AuthenticationSchemes = "AdminRole")]
    public class RoleController : Controller
    {
        private readonly ApplicationDbContext _context;

        public RoleController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index(int pageNumer = 1)
        {
            if(pageNumer < 1)
            {
                pageNumer = 1;
            }

            var pageSzie = 10;
            var pageList = _context.Roles.OrderBy(r => r.Id).ToPagedList(pageNumer, pageSzie);
            return View(pageList);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Role data)
        {
            _context.Roles.Add(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var role = _context.Roles.Find(id);
            if(role == null)
            {
                return NotFound();
            }
            else
            {
                return View(role);
            }
        }

        [HttpPost]
        public IActionResult Edit(Role data)
        {
            _context.Roles.Update(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Delete(int id)
        {
            var role = _context.Roles.Find(id);
            if(role == null)
            {
                return NotFound();
            }
            else
            {
                _context.Remove(role);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
        }
    }
}
