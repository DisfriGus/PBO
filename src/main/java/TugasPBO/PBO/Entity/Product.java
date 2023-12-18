package TugasPBO.PBO.Entity;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "product")

public class Product{
    @Id
    private String id;
    private String Title;
    private String deskripsiProduct;
    private int harga;
    private Category[] categories;

    public Product( String id, String namaProduct, String deskripsiProduct, int harga, Category[] categories) {
        this.id = id;
        this.Title = namaProduct;
        this.deskripsiProduct = deskripsiProduct;
        this.harga = harga;
        this.categories = categories;
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
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }

    public Category[] getCategories() {
        return categories;
    }

    public void setCategories(Category[] categories) {
        this.categories = categories;
    }
}
