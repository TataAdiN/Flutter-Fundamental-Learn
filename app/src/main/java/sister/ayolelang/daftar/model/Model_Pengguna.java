package sister.ayolelang.daftar.model;

import sister.ayolelang.login.model.Model_Akun;

public class Model_Pengguna extends Model_Akun {
    private String nama, nik, alamat;

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public void setNik(String nik) {
        this.nik = nik;
    }

    public String getNama() {
        return nama;
    }

    public String getNik() {
        return nik;
    }

    public String getAlamat() {
        return alamat;
    }
}
