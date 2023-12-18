package TugasPBO.PBO.Controller;

import TugasPBO.PBO.Entity.Category;
import TugasPBO.PBO.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/api/v1/category")
@Controller
public class CategoryController {
    @Autowired
    public CategoryService categoryService;

    @GetMapping
    public void daftarKategori(){
        for (Category category: categoryService.allCategory()){
            System.out.println(category.getNamaKategori());
        }
    }
}
