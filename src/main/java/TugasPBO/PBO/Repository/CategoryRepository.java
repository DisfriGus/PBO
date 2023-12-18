package TugasPBO.PBO.Repository;

import TugasPBO.PBO.Entity.Category;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface CategoryRepository extends MongoRepository<Category, String> {
}
