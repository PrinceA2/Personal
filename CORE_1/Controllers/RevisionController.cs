using Microsoft.AspNetCore.Mvc;

namespace CORE_1.Controllers
{
    public class RevisionController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(IFormCollection obj)
        { 
            int num1 = Convert.ToInt32(obj["txt1"].ToString());
            int num2 = Convert.ToInt32(obj["txt2"].ToString());
            int num3 = num1 + num2;
            ViewBag.result = "The Result is: " + num3;
            return View();
        }
      
    }
}
