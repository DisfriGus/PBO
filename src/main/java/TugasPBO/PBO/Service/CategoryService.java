package TugasPBO.PBO.Service;

import TugasPBO.PBO.Entity.Category;
import TugasPBO.PBO.Entity.Product;
import TugasPBO.PBO.Repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {
    @Autowired
    public CategoryRepository categoryRepository;

    public List<Category> allCategory(){return categoryRepository.findAll();}
    public Optional<Category> singleCategory(String id){
        return categoryRepository.findById(id);
    }

    public void saveCategory(Category category) {
        categoryRepository.save(category);
    }
}
