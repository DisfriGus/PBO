package TugasPBO.PBO.Entity;

public class orderProduct {
    private Product product;
    private int jumlahBarang;

    public orderProduct(Product product, int jumlahBarang) {
        this.product = product;
        this.jumlahBarang = jumlahBarang;
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
