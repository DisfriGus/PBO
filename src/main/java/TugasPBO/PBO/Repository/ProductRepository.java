package TugasPBO.PBO.Repository;

import TugasPBO.PBO.Entity.Product;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ProductRepository extends MongoRepository<Product, String> {
}
