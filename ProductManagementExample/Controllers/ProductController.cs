using ProductManagementExample.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ProductManagementExample.Controllers
{
    public class ProductController : ApiController
    {
        private IProductRepository productRepository;
        public ProductController(IProductRepository productRepository)
        {
            this.productRepository = productRepository;
        }

        // GET api/<controller>
        public IHttpActionResult Get(bool showDisabled = false)
        {
            List< Product > result;
            if (showDisabled)
            {
                result = productRepository.Fetch();
            }
            else
            {
                result = productRepository.FetchActive();
            }
            return Ok<List<Product>>(result);
        }

        // GET api/<controller>/5
        public IHttpActionResult Get(int id)
        {
            var result = productRepository.FetchById(id);
            if (result == null)
            {
                return NotFound();
            }
            return Ok(result);
        }

        // POST api/<controller>
        public IHttpActionResult Post([FromBody]Product input)
        {
            var result = productRepository.Create(input);
            if (result == null)
            {
                return BadRequest();
            }
            return Ok(result);
        }

        // PUT api/<controller>/5
        public IHttpActionResult Put([FromBody]Product input)
        {
            var result = productRepository.Update(input);
            if (result == null)
            {
                return BadRequest();
            }
            return Ok(result);
        }

        // DELETE api/<controller>/5
        public IHttpActionResult Delete(int id)
        {
            if (!productRepository.Delete(id))
            {
                return NotFound();
            }
            return Ok();
        }
    }
}