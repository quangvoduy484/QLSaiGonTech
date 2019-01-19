using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using QLSaiGonTechAPI.Models;

namespace QLSaiGonTechAPI.Controllers
{
    public class CandidateTypeController : ApiController
    {
        private DB_QLSaiGonTech db = new DB_QLSaiGonTech();

        // GET api/CandidateType
        public IEnumerable<CANDIDATETYPE> GetCANDIDATETYPEs()
        {
            return db.CANDIDATETYPEs.AsEnumerable();
        }

        // GET api/CandidateType/5
        public CANDIDATETYPE GetCANDIDATETYPE(string id)
        {
            CANDIDATETYPE candidatetype = db.CANDIDATETYPEs.Find(id);
            if (candidatetype == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return candidatetype;
        }

        // PUT api/CandidateType/5
        public HttpResponseMessage PutCANDIDATETYPE(string id, CANDIDATETYPE candidatetype)
        {
            if (ModelState.IsValid && id == candidatetype.ID_CANDIDATE)
            {
                db.Entry(candidatetype).State = EntityState.Modified;

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }

                return Request.CreateResponse(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // POST api/CandidateType
        public HttpResponseMessage PostCANDIDATETYPE(CANDIDATETYPE candidatetype)
        {
            if (ModelState.IsValid)
            {
                db.CANDIDATETYPEs.Add(candidatetype);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, candidatetype);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = candidatetype.ID_CANDIDATE }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/CandidateType/5
        public HttpResponseMessage DeleteCANDIDATETYPE(string id)
        {
            CANDIDATETYPE candidatetype = db.CANDIDATETYPEs.Find(id);
            if (candidatetype == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.CANDIDATETYPEs.Remove(candidatetype);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, candidatetype);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}