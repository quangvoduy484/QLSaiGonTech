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
        //Create
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
      
        // Xóa
        public ActionResult Delete(string id)
        {
           
            pr.Delete(id);
            return RedirectToAction("Index");
        }
        //Update
        [HttpGet]
        public ActionResult Edit(string id)
        {
            CandidateType candidate = pr.finID(id);

            return View("Edit", candidate);

        }
        [HttpPost]
        public ActionResult Edit(CandidateType candidateType)
        {
            pr.Edit(candidateType);
            return RedirectToAction("Index");

        }


    }
}
