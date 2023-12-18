package TugasPBO.PBO.Entity;

public class Customer extends User{
    private String alamat;
    private  String nomorHP;

    public Customer(String id, String username, String password, String email) {
        super(id, username, password, email);
    }

    public Customer(String alamat, String nomorHP) {
        this.alamat = alamat;
        this.nomorHP = nomorHP;
    }

    public Customer(String id, String username, String password, String email, String alamat, String nomorHP) {
        super(id, username, password, email);
        this.alamat = alamat;
        this.nomorHP = nomorHP;
    }

    public Customer() {

    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getNomorHP() {
        return nomorHP;
    }

    public void setNomorHP(String nomorHP) {
        this.nomorHP = nomorHP;
    }
}
