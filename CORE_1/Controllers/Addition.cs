using CORE_1.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Reflection.Metadata;

namespace CORE_1.Controllers
{
    public class Addition : Controller
    {
        private readonly ILogger<Addition> _logger;

        public Addition(ILogger<Addition> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }


        // the HttpPost function is used to handle form submissions from the corresponding view.
        //The [HttpPost] attribute in ASP.NET Core signifies that the method it decorates is intended to handle HTTP POST requests.
        [HttpPost]
        //HttpPost is actually helping to create an action method that will
       
        public IActionResult Index(IFormCollection obj)
        {
            // IFormCollection is used to create a object that will store whatever the content is being stored inside the form.
            // And with the help of the object we'll fetch the entered values from the textboxes (using the textbox id's).
            //ALSO :----------  used to gather form data submitted via a POST request.

            int num1 = Convert.ToInt32(obj["txt1"].ToString());
            int num2 = Convert.ToInt32(obj["txt2"].ToString());
            int sum = num1 * num2;

            //ViewBag is used as an object to bring any content from the controller to view.
            //The result of the calculation is stored in ViewBag.data. This data can be passed to the corresponding view to be displayed to the user.

            ViewBag.data = "The Result is" + sum;

            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
