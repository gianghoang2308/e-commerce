using E.CommerceProject.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace E.CommerceProject.ViewComponents
{
    public class OrderInformationViewComponent : ViewComponent
    {
        public async Task<IViewComponentResult> InvokeAsync()
        {
            var cart = new List<CartItem>();

            var sessionData = HttpContext.Session.GetString("Cart");
            if (!string.IsNullOrEmpty(sessionData))
            {
                cart = JsonConvert.DeserializeObject<List<CartItem>>(sessionData);
            }

            return View("Default", cart);
        }
    }
}
