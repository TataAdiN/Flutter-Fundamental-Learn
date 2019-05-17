package sister.ayolelang.login.model;

public class Model_Akun {
    private String email, password, tipe;

    public void setTipe(String tipe) {
        this.tipe = tipe;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getTipe() {
        return tipe;
    }
}
