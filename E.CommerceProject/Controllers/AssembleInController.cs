using E.CommerceProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;
using X.PagedList.Extensions;

namespace E.CommerceProject.Controllers
{
    [Authorize(AuthenticationSchemes = "AdminRole")]
    public class AssembleInController : Controller
    {
        readonly private ApplicationDbContext _context;

        public AssembleInController (ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index(int pageNumber = 1)
        {
            if(pageNumber <0)
            {
                pageNumber = 1;
            }

            var pageSize = 10;
            var pageList = _context.AssembleIns.OrderBy(a => a.Id).ToPagedList(pageNumber, pageSize);

            return View(pageList);
        }

        [HttpGet]
        public IActionResult Detail(int id)
        {
            var assembleIn = _context.AssembleIns.Find(id);
            if(assembleIn == null)
            {
                return NotFound();
            }
            else
            {
                return View(assembleIn);
            }
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(AssembleIn data)
        {
            _context.AssembleIns.Add(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var assembleIn = _context.AssembleIns.Find(id);
            if(assembleIn == null)
            {
                return NotFound();
            }
            return View();
        }

        [HttpPost]
        public IActionResult Edit(AssembleIn data)
        {
            _context.AssembleIns.Update(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Delete(int id)
        {
            var assembleIn = _context.AssembleIns.Find(id);
            if(assembleIn == null)
            {
                return NotFound();
            }
            else
            {
                _context.AssembleIns.Remove(assembleIn);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
        }
    }
}
