package TugasPBO.PBO.Controller;

import TugasPBO.PBO.Entity.Category;
import TugasPBO.PBO.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@RequestMapping("/api/v1/category")
@Controller
public class CategoryController {
    @Autowired
    public CategoryService categoryService;

    @GetMapping
    public ResponseEntity<List<Category>> getAllCategory(){
        return  new ResponseEntity<List<Category>>(categoryService.allCategory(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public  ResponseEntity<Optional<Category>> getSingleTanaman(@PathVariable String id){
        return  new ResponseEntity<Optional<Category>>(categoryService.singleCategory(id), HttpStatus.OK);
    }
}
