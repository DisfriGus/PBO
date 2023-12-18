package TugasPBO.PBO.Controller;

import TugasPBO.PBO.Entity.Product;
import TugasPBO.PBO.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/api/v1/product")
@Controller
public class ProductController {
    @Autowired
    public ProductService productService;

    @GetMapping
    public List<Product> getProduct(){
        for (Product product: productService.allProduct()){
            System.out.println(product.getNamaProduct());
        }
        return productService.productRepository.findAll();
    }


}
