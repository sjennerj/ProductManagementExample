using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductManagementExample.Repositories
{
    public interface IProductRepository
    {
        List<Product> Fetch();
        List<Product> FetchActive();
        Product FetchById(int id);
        Product Create(Product product);
        Product Update(Product product);
        bool Delete(int id);

    }
}
