using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http.Formatting;
using QLSaiGonTech.Models;
using System.Net.Http;
using System.Net.Http.Headers;

namespace QLSaiGonTech.Models
{
    public class CanididateClient
    {
        private string BASE_URL = "http://localhost:10526/api/";

        public IEnumerable<CandidateType> finAll()
        {
            try
            {
                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri(BASE_URL);
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
                // yêu cầu lấy giá trị trả về từ api 
                HttpResponseMessage response = client.GetAsync("CandidateType").Result;
                if (response.IsSuccessStatusCode)
                    return response.Content.ReadAsAsync<IEnumerable<CandidateType>>().Result;
                return null;


            }
            catch
            {
                return null;

            }

        }
        public CandidateType finID(string id)
        {
            try
            {
                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri(BASE_URL);
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
                // yêu cầu lấy giá trị trả về từ api 
                HttpResponseMessage response = client.GetAsync("CandidateType/"+id).Result;
                if (response.IsSuccessStatusCode)
                    return response.Content.ReadAsAsync<CandidateType>().Result;
                return null;


            }
            catch
            {
                return null;

            }

        }

        public bool Create(CandidateType candidateType)
        {
            try
            {
                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri(BASE_URL);
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
                // yêu cầu lấy giá trị trả về từ api 
                HttpResponseMessage response = client.PostAsJsonAsync("CandidateType", candidateType).Result;
                
                    return response.IsSuccessStatusCode;

            }
            catch
            {
                return false;

            }

        }
        public bool Edit(CandidateType candidateType)
        {
            try
            {
                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri(BASE_URL);
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
                // yêu cầu lấy giá trị trả về từ api 
                HttpResponseMessage response = client.PutAsJsonAsync("CandidateType/"+candidateType.ID_CANDIDATE, candidateType).Result;

                return response.IsSuccessStatusCode;

            }
            catch
            {
                return false;

            }

        }
        public bool Delete(string id)
        {
            try
            {
                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri(BASE_URL);
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
                // yêu cầu lấy giá trị trả về từ api 
                HttpResponseMessage response = client.DeleteAsync("CandidateType/" + id).Result;

                return response.IsSuccessStatusCode;

            }
            catch
            {
                return false;

            }

        }

    }
}