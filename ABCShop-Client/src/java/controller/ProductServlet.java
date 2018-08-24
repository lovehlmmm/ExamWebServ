package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;
import service.Product;
import service.ProductWebService_Service;

/**
 *
 * @author admin
 */
public class ProductServlet extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/ABCShop/ProductWebService.wsdl")
    private ProductWebService_Service service;

    //Xóa hết những phần không liên quan và để lại methd doPost như bên dưới
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Get value from input
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        //Setter to model product
        Product p = new Product();
        p.setId(id);
        p.setName(name);
        p.setPrice(Float.parseFloat(price));
        p.setQuantity(Integer.parseInt(quantity));
        //Boolean add and get list
        if (addProduct(p)) {
            if (getAllProducts() != null) {
                request.setAttribute("items", getAllProducts());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            request.setAttribute("message", "Error get list!");
            request.getRequestDispatcher("product.jsp").forward(request, response);
        }
        request.setAttribute("message", "Error add the new product!");
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    private boolean addProduct(service.Product p) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        service.ProductWebService port = service.getProductWebServicePort();
        return port.addProduct(p);
    }

    private java.util.List<service.Product> getAllProducts() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        service.ProductWebService port = service.getProductWebServicePort();
        return port.getAllProducts();
    }

}
