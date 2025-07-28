using E.CommerceProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;
using X.PagedList.Extensions;

namespace E.CommerceProject.Controllers
{
    [Authorize(AuthenticationSchemes = "AdminRole")]
    public class ContactController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ContactController(ApplicationDbContext context)
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
            var pageList = _context.Contacts.OrderBy(o => o.Id).ToPagedList(pageNumber, pageSize);
            return View(pageList);
        }

        [HttpGet]
        public IActionResult Detail(int id)
        {
            var contact = _context.Contacts.Find(id);
            if (contact == null)
            {
                return NotFound();
            }
            else
            {
                return View(contact);
            }
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Contact data)
        {
            _context.Contacts.Add(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var contact = _context.Contacts.Find(id);
            if(contact == null)
            {
                return NotFound();
            }
            else
            {
                return View(contact);
            }
        }

        [HttpPost]
        public IActionResult Edit(Contact data)
        {
            _context.Contacts.Update(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult Delete(int id)
        {
            var contact = _context.Contacts.Find(id);
            if (contact == null)
            {
                return NotFound();
            }
            else
            {   _context.Contacts.Remove(contact);
                _context.SaveChanges();
                return View(contact);
            }
        }


       
    }
}
