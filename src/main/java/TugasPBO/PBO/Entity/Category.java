package TugasPBO.PBO.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "category")
public class Category {
    private String Title;
    @Id
    private String idKategori;
    public Category(){

    }
    public Category(String namaKategori, String idKategori) {
        this.Title = namaKategori;
        this.idKategori = idKategori;
    }

    public String getNamaKategori() {
        return Title;
    }

    public String getIdKategori() {
        return idKategori;
    }

    public void setIdKategori(String idKategori) {
        this.idKategori = idKategori;
    }

    public void setNamaKategori(String namaKategori) {
        this.Title = namaKategori;
    }
}
