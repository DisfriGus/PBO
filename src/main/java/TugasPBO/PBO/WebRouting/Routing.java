package TugasPBO.PBO.WebRouting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class Routing {
    @GetMapping("/")
    public String index() {
        return "index";
    }
    @GetMapping("/profile-setting")
    public String profile() {
        return "profile";
    }
    @GetMapping("/login")
    public String Login() {
        return "login";
    }
    @GetMapping("/daftar")
    public String register(){
        return "daftar";
    }

}
