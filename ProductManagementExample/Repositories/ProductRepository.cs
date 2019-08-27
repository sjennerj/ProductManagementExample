using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ProductManagementExample.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private ProductManagementEntities db;
        public ProductRepository()
        {
            db = new ProductManagementEntities();
        }

        public List<Product> Fetch()
        {
            return db.Products.ToList();
        }

        public List<Product> FetchActive()
        {
            return db.Products.Where(x => x.Archived == null || x.Archived == false).ToList();
        }

        public Product FetchById(int ID)
        {
            return db.Products.Where(x => x.ID == ID).FirstOrDefault();
        }

        public Product Create(Product product)
        {
            Product newProduct = db.Products.Add(product);
            if (Save())
            {
                return newProduct;
            }
            else
            {
                return null;
            }
        }

        public Product Update(Product product)
        {
            var existingProduct = db.Products.Where(x => x.ID == product.ID).FirstOrDefault();
            if (existingProduct != null)
            {
                existingProduct.Number = product.Number;
                existingProduct.Price = product.Price;
                existingProduct.Description = product.Description;
                existingProduct.Archived = product.Archived;
                if (Save())
                {
                    return existingProduct;
                }
            }
            return null;
        }

        public bool Delete(int id)
        {
            var product = this.FetchById(id);
            if (product != null)
            {
                db.Products.Remove(product);
                return Save();
            }
            else
            {
                return false;
            }
        }

        private bool Save()
        {
            return db.SaveChanges() > 0;
        }
    }
}