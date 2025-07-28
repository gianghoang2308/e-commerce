using Microsoft.AspNetCore.Mvc;
using E.CommerceProject.Models;
using System.Linq;
using Microsoft.AspNetCore.Http;
using System.IO;
using System.Collections.Generic;
using X.PagedList;
using Microsoft.EntityFrameworkCore;
using NuGet.Versioning;
using Microsoft.AspNetCore.Authorization;
using X.PagedList.Extensions;

namespace E.CommerceProject.Controllers
{
    [Authorize(AuthenticationSchemes = "AdminRole")]
    public class ProductImageController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ProductImageController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: ProductImage
        public IActionResult Index(int pageNumber = 1)
        {
            if (pageNumber < 1)
            {
                pageNumber = 1;
            }

            int pageSize = 10;

            var pagedList = _context.ProductImages
                .Include(p => p.Product)
                .OrderBy(img => img.Id)
                .ToPagedList(pageNumber, pageSize);

            return View(pagedList); // ✅ Trả về đúng kiểu IPagedList
        }


        // GET: ProductImage/Details/5
        public IActionResult Details(int id)
        {
            var image = _context.ProductImages
                         .Include(p => p.Product)
                         .FirstOrDefault(p => p.Id == id);
            if (image == null)
                return NotFound();

            return View(image);
        }

        // GET: ProductImage/Create
        public IActionResult Create()
        {
            ViewBag.Products = _context.Products.ToList();
            return View();
        }

        // POST: ProductImage/Create
        [HttpPost]
        public IActionResult Create(List<IFormFile> files, int ProductId)
        {
            foreach (var file in files)
            {
                if (file.Length > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine("wwwroot/uploads/images/detailimages", fileName);

                    using (var stream = new FileStream(path, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }

                    var productImage = new ProductImage
                    {
                        Images = fileName,
                        ProductId = ProductId
                    };

                    _context.ProductImages.Add(productImage);
                }
            }

            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: ProductImage/Edit/5
        public IActionResult Edit(int id)
        {
            var image = _context.ProductImages
                .Include(p => p.Product)
                .FirstOrDefault(p => p.Id == id);

            if (image == null)
                return NotFound();

            ViewBag.Products = _context.Products.ToList();
            return View(image);
        }

        // POST: ProductImage/Edit/5
        [HttpPost]
        public IActionResult Edit(int id, IFormFile file, int ProductId)
        {
            var image = _context.ProductImages.Find(id);
            if (image == null)
                return NotFound();

            // Nếu người dùng upload ảnh mới
            if (file != null && file.Length > 0)
            {
                var fileName = Path.GetFileName(file.FileName);
                var uploadPath = Path.Combine("wwwroot/uploads/images/detailimages", fileName);

                // Đảm bảo thư mục tồn tại
                var directory = Path.GetDirectoryName(uploadPath);
                if (!Directory.Exists(directory))
                    Directory.CreateDirectory(directory);

                using (var stream = new FileStream(uploadPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }

                // Cập nhật đường dẫn mới
                image.Images =  fileName;
            }

            image.ProductId = ProductId;
            _context.SaveChanges();

            return RedirectToAction("Index");
        }


        // GET: ProductImage/Delete/5
        public IActionResult Delete(int id)
        {
            var image = _context.ProductImages.Find(id);
            if (image == null)
                return NotFound();

            return View(image);
        }

        // POST: ProductImage/Delete/5
        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            var image = _context.ProductImages.Find(id);
            if (image != null)
            {
                _context.ProductImages.Remove(image);
                _context.SaveChanges();
            }

            return RedirectToAction("Index");
        }
    }
}
