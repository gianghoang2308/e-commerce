using E.CommerceProject.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using X.PagedList;
using X.PagedList.Extensions;

namespace E.CommerceProject.Controllers
{
    [Authorize(AuthenticationSchemes = "AdminRole,UserRole")]
    public class UserController : Controller
    {
        private readonly ApplicationDbContext _context;

        public UserController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index(int pageNumber = 1)
        {
            var pageSize = 10;
            var pageList = _context.Users.OrderBy(a => a.Id).Include(a => a.Role).ToPagedList(pageNumber, pageSize);
            return View(pageList);
        }

        [HttpGet]
        public IActionResult Detail(int id)
        {
            var admin = _context.Users.Find(id);
            if (admin == null)
            {
                return NotFound();
            }
            else
            {
                return View(admin);
            }
        }

        [HttpGet]
        public IActionResult Create()
        {
            var issuePlaces = new List<string>
            {
                "Cục quản lý hành chính về TTXH",
                "Cục quản lý xuất nhập cảnh",
                "An Giang", "Bà Rịa - Vũng Tàu", "Bạc Liêu", "Bắc Giang", "Bắc Kạn",
                "Bắc Ninh", "Bến Tre", "Bình Dương", "Bình Định", "Bình Phước", "Bình Thuận",
                "Cà Mau", "Cao Bằng", "Cần Thơ", "Đà Nẵng", "Đắk Lắk", "Đắk Nông", "Điện Biên"
            };


            ViewBag.IssuePlaces = new SelectList(issuePlaces);

            List<Role> cat = _context.Roles.ToList();
            ViewBag.RoleList = cat;

            var model = new User();
            return View();
        }

        [HttpPost]
        public IActionResult Create(User data)
        {
            var issuePlaces = new List<string>
            {
                "Cục quản lý hành chính về TTXH",
                "Cục quản lý xuất nhập cảnh",
                "An Giang", "Bà Rịa - Vũng Tàu", "Bạc Liêu", "Bắc Giang", "Bắc Kạn",
                "Bắc Ninh", "Bến Tre", "Bình Dương", "Bình Định", "Bình Phước", "Bình Thuận",
                "Cà Mau", "Cao Bằng", "Cần Thơ", "Đà Nẵng", "Đắk Lắk", "Đắk Nông", "Điện Biên"
            };
            ViewBag.IssuePlaces = new SelectList(issuePlaces);

            data.UserPassword = Cipher.GenerateSHA256(data.UserPassword);
            data.CreateTime = DateTime.Now;

            List<Role> cat = _context.Roles.ToList();
            ViewBag.RoleList = cat;

            var files = HttpContext.Request.Form.Files;
            string[] imageFields = new string[] { "Avatar", "Image1", "Image2", "Image3" };

            if (files.Count > 0)
            {

    
                for (int i = 0; i < files.Count && i < imageFields.Length; i++)
                {
                    var file = files[i];
                    if (file.Length > 0)
                    {
                        var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "users");

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


                        if (i == 0) data.Avatar = fileName;
                        else if (i == 1) data.IdCardFront = fileName;
                        else if (i == 2) data.IdCardBack = fileName;
                    }
                }
            }

            _context.Users.Add(data);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var user = _context.Users.Find(id);
            if (user == null)
            {
                return NotFound();
            }
            else
            {

                var issuePlaces = new List<string>
                {
                    "Cục quản lý hành chính về TTXH",
                    "Cục quản lý xuất nhập cảnh",
                    "An Giang", "Bà Rịa - Vũng Tàu", "Bạc Liêu", "Bắc Giang", "Bắc Kạn",
                    "Bắc Ninh", "Bến Tre", "Bình Dương", "Bình Định", "Bình Phước", "Bình Thuận",
                    "Cà Mau", "Cao Bằng", "Cần Thơ", "Đà Nẵng", "Đắk Lắk", "Đắk Nông", "Điện Biên"
                };

                ViewBag.IssuePlaces = new SelectList(issuePlaces);

                List<Role> cat = _context.Roles.ToList();
                ViewBag.RoleList = cat;

                return View(user);
            }

        }


        [HttpPost]
        public IActionResult Edit(User data, string oldAvatar, string oldFront, string oldBack, string oldPassword, string NewPassword)
        {
            var issuePlaces = new List<string>
                {
                    "Cục quản lý hành chính về TTXH",
                    "Cục quản lý xuất nhập cảnh",
                    "An Giang", "Bà Rịa - Vũng Tàu", "Bạc Liêu", "Bắc Giang", "Bắc Kạn",
                    "Bắc Ninh", "Bến Tre", "Bình Dương", "Bình Định", "Bình Phước", "Bình Thuận",
                    "Cà Mau", "Cao Bằng", "Cần Thơ", "Đà Nẵng", "Đắk Lắk", "Đắk Nông", "Điện Biên"
                };

            ViewBag.IssuePlaces = new SelectList(issuePlaces);

            List<Role> cat = _context.Roles.ToList();
            ViewBag.RoleList = cat;


            var existingAdmin = _context.Users.Find(data.Id);
            if (existingAdmin == null)
                return NotFound();

            if (!string.IsNullOrEmpty(NewPassword))
            {
                data.UserPassword = Cipher.GenerateSHA256(NewPassword);
            }
            else
            {
                data.UserPassword = oldPassword;
            }

            var files = HttpContext.Request.Form.Files;
            string avatarFileName = oldAvatar;
            string idCardFrontFileName = oldFront;
            string idCardBackFileName = oldBack;

            foreach (var file in files)
            {
                if (file.Length > 0)
                {
                    var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "admins");
                    if (!Directory.Exists(uploadsFolder)) Directory.CreateDirectory(uploadsFolder);

                    var fileName = Path.GetFileName(file.FileName);
                    var filePath = Path.Combine(uploadsFolder, fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }

                    if (file.Name == "Avatar") avatarFileName = fileName;
                    else if (file.Name == "IdCardFront") idCardFrontFileName = fileName;
                    else if (file.Name == "IdCardBack") idCardBackFileName = fileName;
                }
            }

            data.Avatar = avatarFileName;
            data.IdCardFront = idCardFrontFileName;
            data.IdCardBack = idCardBackFileName;

            _context.Entry(existingAdmin).CurrentValues.SetValues(data);
            _context.SaveChanges();

            if (User.FindFirstValue("id") == data.Id.ToString())
            {
                HttpContext.SignOutAsync().Wait();
                return RedirectToAction("Login");
            }

            return RedirectToAction("Index");
        }




        [HttpGet]
        public IActionResult Delete(int id)
        {
            var admin = _context.Users.Find(id);
            if (admin == null)
            {
                return NotFound();
            }
            else
            {
                _context.Remove(admin);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
        }

        [AllowAnonymous]
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult Login(User data)
        {
            if (string.IsNullOrEmpty(data.UserAccount) || string.IsNullOrEmpty(data.UserPassword))

            {
                ViewBag.Error = "<div class='alert alert-danger'>Tên đăng nhập và mật khẩu không được để trống</div>";
                return View(data);
            }

            var passSHA256 = Cipher.GenerateSHA256(data.UserPassword);
            var account = _context.Users.SingleOrDefault(x => x.UserAccount == data.UserAccount && x.UserPassword == passSHA256);

            if (account != null)
            {
                var claims = new List<Claim>
                {
                    new Claim("account", account.UserAccount ?? ""),
                    new Claim("id", account.Id.ToString()),
                    new Claim("fullname", account.FullName ?? ""),
                    new Claim("email", account.Email ?? ""),
                    new Claim("phone", account.PhoneNumber ?? ""),
                    new Claim("avatar", "/uploads/users/" + account.Avatar),
                    new Claim(ClaimTypes.Role, "UserRole")
                };

                var identity = new ClaimsIdentity(claims, "UserRole");
                var principal = new ClaimsPrincipal(identity);

                var authProperties = new AuthenticationProperties
                {
                    IsPersistent = true,
                    ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(30)
                };

                var login = HttpContext.SignInAsync("UserRole", principal, authProperties);


                return RedirectToAction("Index", "Home");
            }

            ViewBag.Error = "<div class='alert alert-danger'>Tên đăng nhập hoặc mật khẩu sai</div>";
            return View(data);
        }


        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync("UserRole");
            return RedirectToAction("Login", "User");
        }


        [AllowAnonymous]
        [HttpGet]
        public IActionResult Register()
        {
           
            return View();
        }


        [AllowAnonymous]
        [HttpPost]
        public IActionResult Register(User data)
        {
            data.Avatar = "";
            data.RoleId = 2;
            data.IdCardFront = "";
            data.IdCardBack = "";
            data.DateOfIssue = DateTime.Now;
            data.PlaceOfIssue = "";

            if (string.IsNullOrEmpty(data.UserPassword))
            {
                ModelState.AddModelError("UserPassword", "Vui lòng nhập mật khẩu");
                return View(data);
            }

            var existingUser = _context.Users.FirstOrDefault(u => u.UserAccount == data.UserAccount || u.Email == data.Email);
            if (existingUser != null)
            {
                if (existingUser.UserAccount == data.UserAccount)
                    ModelState.AddModelError("UserAccount", "Tên tài khoản đã tồn tại");
                if (existingUser.Email == data.Email)
                    ModelState.AddModelError("Email", "Email đã được đăng ký");

                return View(data);
            }

            data.UserPassword = Cipher.GenerateSHA256(data.UserPassword);

            _context.Users.Add(data);
            _context.SaveChanges();

            TempData["RegisterSuccess"] = "Đăng ký thành công! Vui lòng đăng nhập.";

            return RedirectToAction("Login", "User");
        }



    }
}
