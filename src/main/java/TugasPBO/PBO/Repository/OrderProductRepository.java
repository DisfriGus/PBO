package TugasPBO.PBO.Repository;

import TugasPBO.PBO.Entity.orderProduct;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import java.util.Optional;

public interface OrderProductRepository extends MongoRepository<orderProduct, String> {
}
