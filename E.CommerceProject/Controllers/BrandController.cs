using E.CommerceProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;
using X.PagedList.Extensions;

namespace E.CommerceProject.Controllers
{
    [Authorize(AuthenticationSchemes = "AdminRole")]
    public class BrandController : Controller
    {
        private readonly ApplicationDbContext _context;

        public BrandController(ApplicationDbContext context)
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
            var pageList = _context.Brands.OrderBy(b =>b.Id).ToPagedList(pageNumber, pageSize);
            return View(pageList);
        }

        [HttpGet]
        public IActionResult Detail(int id)
        {
            var brand = _context.Brands.Find(id);
            if(brand == null)
            {
                return NotFound();
            }
            else
            {
                return View(brand);
            }

        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Brand data)
        {
            data.CreatedDate = DateTime.Now;
            var file = Request.Form.Files.FirstOrDefault();
            if (file != null && file.Length > 0)
            {
                var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "brandlogos");

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
            _context.Brands.Add(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var brand = _context.Brands.Find(id);
            if (brand == null)
            {
                return NotFound();
            }
            else
            {
                return View(brand);
            }
        }
        [HttpPost]
        public IActionResult Edit(Brand data, string oldLogo)
        {
            data.CreatedDate = DateTime.Now;

           
            var file = Request.Form.Files.FirstOrDefault();

            if (file != null && file.Length > 0)
            {
                var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "brandlogos");

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

            _context.Brands.Update(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }


        [HttpPost]
        public IActionResult Delete(int id)
        {
            var brand = _context.Brands.Find(id);
            if (null == brand)
            {
                return NotFound();
            }
            else
            {
                _context.Brands.Remove(brand);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
            
        }
    }
}
