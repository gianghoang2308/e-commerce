
using E.CommerceProject.Models;
using Microsoft.AspNetCore.Mvc;

namespace E.CommerceProject.ViewComponents
{
    public class FooterViewComponent : ViewComponent
    {
        private readonly ApplicationDbContext _context;


        public FooterViewComponent(ApplicationDbContext context)
        {
            _context = context;
        }

        public IViewComponentResult Invoke()
        {
            List<Config> configs = _context.Configs.ToList();
            ViewBag.Configs = configs;
            return View();
        }
    }
}
