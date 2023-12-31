package TugasPBO.PBO.Controller;

import TugasPBO.PBO.Entity.Category;
import TugasPBO.PBO.Entity.Product;
import TugasPBO.PBO.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/api/v1/product")
@Controller
public class ProductController {
    @Autowired
    public ProductService productService;


    @GetMapping
    public ResponseEntity<List<Product>> semuaProduk(){
        List<Product> products = productService.allProduct();
        for (Product product: products){
            System.out.println(product.getNamaProduct());
        }
        return  new ResponseEntity<List<Product>>(productService.allProduct(), HttpStatus.OK);
    }


}
