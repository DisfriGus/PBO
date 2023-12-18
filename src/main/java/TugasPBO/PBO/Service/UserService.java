package TugasPBO.PBO.Service;

import TugasPBO.PBO.Entity.Admin;
import TugasPBO.PBO.Entity.Customer;
import TugasPBO.PBO.Entity.Product;
import TugasPBO.PBO.Entity.User;
import TugasPBO.PBO.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    public UserRepository userRepository;
    public List<Customer> allUser(){return userRepository.findAll();}
    public Optional<Customer> singleCustomer(String id){
        return userRepository.findById(id);
    }

    public void saveUser(Customer customer) {
        userRepository.save(customer);
    }

    public Customer authenticationLogin(String username, String password){
        Customer customerLogin = new Customer();
        for (Customer customer: userRepository.findAll()){
            if(customer.getUsername().equals(username) && customer.getPassword().equals(password)){
                System.out.println("Berhasil Login");
                System.out.println(customer);
                customerLogin = customer;
                 // Assuming you have a loginSuccess.jsp
            } else {
                System.out.println("Username / Password anda tidak ada");

            }
        }
        return customerLogin;
    }
}
