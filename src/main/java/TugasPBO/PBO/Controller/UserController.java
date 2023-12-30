package TugasPBO.PBO.Controller;


import TugasPBO.PBO.Entity.Customer;
import TugasPBO.PBO.Service.UserService;
import jakarta.servlet.http.HttpSession;
import org.apache.coyote.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/api/v1/customer")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping
    public ResponseEntity<String> Register(@RequestBody Customer customer) {
        userService.saveUser(customer);
        System.out.println("Berhasil Menambahkan User");
        return ResponseEntity.status(HttpStatus.CREATED).body("Added " + customer.getId());
    }
    @GetMapping
    public ResponseEntity<List<Customer>> allUser() {
        List<Customer> customers = userService.userRepository.findAll();
        return ResponseEntity.ok(customers);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Optional<Customer>> login(@PathVariable String id) {

        Optional<Customer> customer = userService.singleCustomer(id);
        if (customer.isPresent()) {
            System.out.println("Berhasil Login");
            return ResponseEntity.ok(customer);
        } else {
            System.out.println("Gagal Login");
            return ResponseEntity.notFound().build();
        }
    }



    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteCustomer(@PathVariable String id) {

        userService.userRepository.deleteById(id);
        return ResponseEntity.status(HttpStatus.OK).body("Customer with id " + id + " has been deleted");
    }


    @PutMapping("/{id}")
    public ResponseEntity<Customer> EditProfile(@PathVariable String id, @RequestBody Customer updatedCustomer) {
        Optional<Customer> existingCustomerOptional = userService.singleCustomer(id);

        if (existingCustomerOptional.isPresent()) {
            Customer existingCustomer = existingCustomerOptional.get();

            // Update data pelanggan dengan data yang baru
            if (updatedCustomer.getUsername() != null) {
                existingCustomer.setUsername(updatedCustomer.getUsername());
            }
            if (updatedCustomer.getEmail() != null) {
                existingCustomer.setEmail(updatedCustomer.getEmail());
            }
            if (updatedCustomer.getAlamat() != null) {
                existingCustomer.setAlamat(updatedCustomer.getAlamat());
            }
            if (updatedCustomer.getNomorHP() != null) {
                existingCustomer.setNomorHP(updatedCustomer.getNomorHP());
            }

            userService.saveUser(existingCustomer);
            System.out.println("Berhasil Memperbaharui User");
            return ResponseEntity.ok(existingCustomer);
        } else {
            // Pelanggan dengan ID yang diberikan tidak ditemukan
            return ResponseEntity.notFound().build();
        }
    }



}
