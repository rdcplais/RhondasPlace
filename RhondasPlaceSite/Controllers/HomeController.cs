using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RhondasPlaceSite.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult FAQ()
        {
            ViewBag.Message = "Frequently Asked Questions";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Everything you want to know...";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Rhonda's Place";

            return View();
        }
    }
}