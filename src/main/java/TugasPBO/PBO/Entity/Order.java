package TugasPBO.PBO.Entity;

import org.springframework.data.annotation.Id;

public class Order {
    @Id
    private String ID;
    private orderProduct[] orderProduct;
    private  String status;
    private  String tanggalPemesanan;

    public Order() {
    }

    public Order(String ID, TugasPBO.PBO.Entity.orderProduct[] orderProduct, String status, String tanggalPemesanan) {
        this.ID = ID;
        this.orderProduct = orderProduct;
        this.status = status;
        this.tanggalPemesanan = tanggalPemesanan;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public TugasPBO.PBO.Entity.orderProduct[] getOrderProduct() {
        return orderProduct;
    }

    public void setOrderProduct(TugasPBO.PBO.Entity.orderProduct[] orderProduct) {
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
