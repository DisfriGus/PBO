package TugasPBO.PBO.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "order")
public class Order {
    @Id
    private String ID;
    private orderProduct[] orderProduct;
    private  String status;
    private  String tanggalPemesanan;

    private String idCustomer;
    public Order() {
    }

    public String getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    public Order(String ID, orderProduct[] orderProduct, String status, String tanggalPemesanan, String idCustomer) {
        this.ID = ID;
        this.orderProduct = orderProduct;
        this.status = status;
        this.tanggalPemesanan = tanggalPemesanan;
        this.idCustomer = idCustomer;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public orderProduct[] getOrderProduct() {
        return orderProduct;
    }

    public void setOrderProduct(orderProduct[] orderProduct) {
        this.orderProduct = orderProduct;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTanggalPemesanan() {
        return tanggalPemesanan;
    }

    public void setTanggalPemesanan(String tanggalPemesanan) {
        this.tanggalPemesanan = tanggalPemesanan;
    }
}
