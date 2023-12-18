package TugasPBO.PBO.Service;

import TugasPBO.PBO.Entity.Product;
import TugasPBO.PBO.Repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class ProductService {
    @Autowired
    public ProductRepository productRepository;
    public List<Product> allProduct(){return productRepository.findAll();}
    public Optional<Product> singleProduct(String id){
        return productRepository.findById(id);
    }

    public void saveUser(Product product) {
        productRepository.save(product);
    }
}
