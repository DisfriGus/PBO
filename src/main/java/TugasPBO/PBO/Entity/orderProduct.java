package TugasPBO.PBO.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "orderProduct")
public class orderProduct {
    @Id
    private  String id;
    private Product product;
    private int jumlahBarang;

    public orderProduct(String id, Product product, int jumlahBarang) {
        this.id = id;
        this.product = product;
        this.jumlahBarang = jumlahBarang;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getJumlahBarang() {
        return jumlahBarang;
    }

    public void setJumlahBarang(int jumlahBarang) {
        this.jumlahBarang = jumlahBarang;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public orderProduct() {
    }
}
