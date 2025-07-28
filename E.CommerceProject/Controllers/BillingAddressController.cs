using E.CommerceProject.Models;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using X.PagedList.Extensions;
using Newtonsoft.Json;

namespace E.CommerceProject.Controllers
{
    [AllowAnonymous]
    public class BillingAddressController : Controller
    {
        private readonly ApplicationDbContext _context;

        public BillingAddressController(ApplicationDbContext context)
        {
            _context = context;
        }

        [Authorize(AuthenticationSchemes = "AdminRole")]
        // GET: BillingAddress
        public IActionResult Index(int? page)
        {
            int pageNumber = page ?? 1;
            int pageSize = 10;
            var list = _context.BillingAddresses.OrderByDescending(x => x.Id).ToPagedList(pageNumber, pageSize);
            return View(list);
        }

        [Authorize(AuthenticationSchemes = "UserRole")]
        // GET: BillingAddress/Create
        public IActionResult Create()
        {
            return View();
        }

        [Authorize(AuthenticationSchemes = "UserRole")]
        [Authorize(AuthenticationSchemes = "AdminRole")]

        // POST: BillingAddress/Create
        [HttpPost]

        public IActionResult Create(BillingAddress model)
        {
           

            if (!model.ShiptoDifferenceAddress)
            {
               
                model.ShippingAddressFirstName = model.BillingAddressFirstName ?? "";
                model.ShippingAddressLastName = model.BillingAddressLastName ?? "";
                model.ShippingAddressEmail = model.BillingAddressEmail ?? "";
                model.ShippingAddressAddress = model.BillingAddressAddress ?? "";
                model.ShippingAddressCity = model.BillingAddressCity ?? "";
                model.ShippingAddressCountry = model.BillingAddressCountry ?? "";
                model.ShippingAddressZipCode = model.BillingAddressZipCode ?? "";
                model.ShippingAddressTelephone = model.BillingAddressTelephone ?? "";
            }  
            _context.BillingAddresses.Add(model);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [Authorize(AuthenticationSchemes = "AdminRole")]
        // GET: BillingAddress/Edit/5
        public IActionResult Edit(int? id)
        {

            var billingAddress = _context.BillingAddresses.Find(id);
            if (billingAddress == null)
                return NotFound();

            return View(billingAddress);
        }

        [Authorize(AuthenticationSchemes = "UserRole")]
        [Authorize(AuthenticationSchemes = "AdminRole")]

        // POST: BillingAddress/Edit/5
        [HttpPost]

        public IActionResult Edit(int id, BillingAddress model)
        {
            if (id != model.Id)
                return NotFound();

            else
            {
                _context.BillingAddresses.Update(model);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }

        }

        [Authorize(AuthenticationSchemes = "UserRole")]
        [Authorize(AuthenticationSchemes = "AdminRole")]

        // GET: BillingAddress/Delete/5
        public IActionResult Delete(int? id)
        {
            if (id == null)
                return NotFound();

            var billingAddress = _context.BillingAddresses.Find(id);
            if (billingAddress == null)
                return NotFound();

            _context.BillingAddresses.Remove(billingAddress);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        [Authorize(AuthenticationSchemes = "UserRole")]
        [Authorize(AuthenticationSchemes = "AdminRole")]
        [HttpGet]
        public IActionResult Checkout()
        {
            var model = new BillingAddress();

            

            return View(model);
        }


        [Authorize(AuthenticationSchemes = "UserRole")]
        [Authorize(AuthenticationSchemes = "AdminRole")]
        [HttpPost]
        public IActionResult Checkout(BillingAddress model)
        {


            model.Id = 0;
            model.OrderNote = string.IsNullOrEmpty(model.OrderNote) ? "No notes provided" : model.OrderNote;

  
            if (!model.ShiptoDifferenceAddress)
            {
                model.ShippingAddressFirstName = model.BillingAddressFirstName ?? "";
                model.ShippingAddressLastName = model.BillingAddressLastName ?? "";
                model.ShippingAddressEmail = model.BillingAddressEmail ?? "";
                model.ShippingAddressAddress = model.BillingAddressAddress ?? "";
                model.ShippingAddressCity = model.BillingAddressCity ?? "";
                model.ShippingAddressCountry = model.BillingAddressCountry ?? "";
                model.ShippingAddressZipCode = model.BillingAddressZipCode ?? "";
                model.ShippingAddressTelephone = model.BillingAddressTelephone ?? "";
            }

            _context.BillingAddresses.Add(model);
            _context.SaveChanges();
            HttpContext.Session.Remove("Cart");

            TempData["SuccessMessage"] = "Bạn đã đặt hàng thành công!";

            return RedirectToAction("Index", "Home");

        }



    }
}
