package service;

import dao.ProductDao;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import model.Product;

/**
 *
 * @author admin
 */
@WebService(serviceName = "ProductWebService")
public class ProductWebService {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getAllProducts")
    public List<Product> getAllProducts() {
        ProductDao p1 = new ProductDao();
        return p1.findAll();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "addProduct")
    public boolean addProduct(@WebParam(name = "p") Product p) {
        ProductDao p1 = new ProductDao();
        return p1.insert(p);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "sellProduct")
    public boolean sellProduct(@WebParam(name = "id") String id, @WebParam(name = "quantity") int quantity) {
        ProductDao p1 = new ProductDao();
        return p1.update(id, quantity);
    }
}
