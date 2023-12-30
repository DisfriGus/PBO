package TugasPBO.PBO.Entity;

import TugasPBO.PBO.Service.CategoryService;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document(collection = "category")
public class Category {
    private String NamaKategori;
    @Id
    private String idKategori;
    public Category(){

    }
    public Category(String namaKategori, String idKategori) {
        this.NamaKategori = namaKategori;
        this.idKategori = idKategori;
    }


    public String getNamaKategori() {
        return NamaKategori;
    }

    public String getIdKategori() {
        return idKategori;
    }

    public void setIdKategori(String idKategori) {
        this.idKategori = idKategori;
    }

    public void setNamaKategori(String namaKategori) {
        this.NamaKategori = namaKategori;
    }

    public void daftarKategori(){
        CategoryService categoryService = new CategoryService();
        List<Category> categories = categoryService.allCategory();
        for (Category category: categories){
            System.out.println(category.getNamaKategori());
        }
    }
}
