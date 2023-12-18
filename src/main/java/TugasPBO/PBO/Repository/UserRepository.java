package TugasPBO.PBO.Repository;

import TugasPBO.PBO.Entity.Customer;
import TugasPBO.PBO.Entity.User;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<Customer, String> {
}
