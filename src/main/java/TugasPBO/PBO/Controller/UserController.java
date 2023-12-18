package TugasPBO.PBO.Controller;


import TugasPBO.PBO.Entity.Customer;
import TugasPBO.PBO.Service.UserService;
import jakarta.servlet.http.HttpSession;
import org.apache.coyote.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping
public class UserController {
    @Autowired
    private UserService userService;
//    Menambahkan Data ke dalam Database
    @PostMapping("/signup-success")
    public String signup(
            @RequestParam String username,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String phone
    ) {
        Customer customer = new Customer();
        customer.setUsername(username);
        customer.setEmail(email);
        customer.setPassword(password);
        customer.setAlamat("");
        customer.setNomorHP(phone);
        System.out.println(customer.getUsername());
        userService.saveUser(customer);

        return "redirect:/login";
    }
    @GetMapping("/allUser")
    public List<Customer> getAllUser(){
        for (Customer customer : userService.allUser()) {
            System.out.println(customer.getUsername());
        }
        return userService.allUser();
    }

    @RequestMapping(value = "/loginSuccess", method = RequestMethod.POST)
    public String login(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session
    ){
        Customer customer = userService.authenticationLogin(username, password);
        if (customer != null){
            // Menyimpan data customer ke sesi
            session.setAttribute("loggedInCustomer", customer);
            return "logged";
        } else {
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String showProfile(HttpSession session, Model model) {
        // Mengambil data customer dari sesi
        Customer customer = (Customer) session.getAttribute("loggedInCustomer");
        model.addAttribute("customer", customer);
        System.out.println(customer.getUsername());
        return "profile";
    }

}
