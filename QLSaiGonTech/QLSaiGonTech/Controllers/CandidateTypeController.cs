using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLSaiGonTech.Models;


namespace QLSaiGonTech.Controllers
{
    public class CandidateTypeController : Controller
    {
        //
        // GET: /CandidateType/
        CanididateClient pr = new CanididateClient();
        public ActionResult Index()
        {
           
            ViewBag.listchuongtrinh = pr.finAll();

            return View();
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();

        }

        [HttpPost]
        public ActionResult Create(CandidateType candidateType)
        {
            pr.Create(candidateType);


            return RedirectToAction("Index");

        }
      

        public ActionResult Delete(string id)
        {
            id = id.Substring(0, 3);
            pr.Delete(id);
            return RedirectToAction("Index");
        }

    }
}
