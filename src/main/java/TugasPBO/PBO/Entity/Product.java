package TugasPBO.PBO.Entity;

import TugasPBO.PBO.Service.CategoryService;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "product")

public class Product{
    public CategoryService categoryService;
    @Id
    private String id;
    private String Title;
    private String URL;


    private String deskripsiProduct;
    private int Harga;
    private Category[] Categories;

    public Product( String id, String namaProduct, String deskripsiProduct, int harga, Category[] Categories) {
        this.id = id;
        this.Title = namaProduct;
        this.deskripsiProduct = deskripsiProduct;
        this.Harga = harga;
        this.Categories = Categories;
    }

    public Product(String namaProduct, String URL, int harga){
        this.Title = namaProduct;
        this.URL = URL;
        this.Harga = harga;
    }
    public Product() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNamaProduct() {
        return Title;
    }

    public void setNamaProduct(String namaProduct) {
        this.Title = namaProduct;
    }

    public String getDeskripsiProduct() {
        return deskripsiProduct;
    }

    public void setDeskripsiProduct(String deskripsiProduct) {
        this.deskripsiProduct = deskripsiProduct;
    }

    public int getHarga() {
        return Harga;
    }

    public void setHarga(int harga) {
        this.Harga = harga;
    }
    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }


    public Category[] getCategories() {
        return Categories;
    }

    public void setCategories(Category[] Categories) {
        this.Categories = Categories;
    }


}
