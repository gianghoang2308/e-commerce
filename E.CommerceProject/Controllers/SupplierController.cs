using E.CommerceProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data.OleDb;
using X.PagedList;
using X.PagedList.Extensions;

namespace E.CommerceProject.Controllers
{
    [Authorize(AuthenticationSchemes = "AdminRole")]
    public class SupplierController : Controller
    {
        private readonly ApplicationDbContext _context;

        public SupplierController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index(int pageNumber = 1)
        {
            if (pageNumber < 1)
            {
                pageNumber = 1;
            }

            var pageSize = 10;
            var pageList = _context.Suppliers.OrderBy(s => s.Id).ToPagedList(pageNumber, pageSize);
            return View(pageList);
        }

        [HttpGet]
        public IActionResult Detail(int id)
        {
            var supplier = _context.Suppliers.Find(id);
            if (supplier == null)
            {
                return NotFound();
            }
            else
            {
                return View(supplier);
            }
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Supplier data)
        {
            data.CreatedDate = DateTime.Now;
            data.UpdatedDate = DateTime.Now;
            data.TaxCode = Guid.NewGuid().ToString();
            data.Website = Guid.NewGuid().ToString();
            var file = Request.Form.Files.FirstOrDefault();
            if (file != null && file.Length > 0)
            {
                var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "supplierlogos");

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
                data.Logo = fileName;
            }
            _context.Suppliers.Add(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var supplier = _context.Suppliers.Find(id);
            if (supplier == null)
            {
                return NotFound();
            }
            else
            {
                return View(supplier);
            }
        }

        [HttpPost]
        public IActionResult Edit(Supplier data, string oldLogo)
        {
            data.UpdatedDate = DateTime.Now;
            data.TaxCode = Guid.NewGuid().ToString();
            data.Website = Guid.NewGuid().ToString();
            var file = Request.Form.Files.FirstOrDefault();

            if (file != null && file.Length > 0)
            {
                var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "supplierlogos");

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
                data.Logo = fileName;
            }
            else
            {
                data.Logo = oldLogo;
            }
            _context.Suppliers.Update(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Delete(int id)
        {
            var supplier = _context.Suppliers.Find(id);
            if(supplier == null)
            {
                return NotFound();
            }
            else
            {
                _context.Remove(supplier);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
        }
    }
}
