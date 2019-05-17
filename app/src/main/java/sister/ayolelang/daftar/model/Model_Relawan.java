package sister.ayolelang.daftar.model;

import sister.ayolelang.login.model.Model_Akun;

public class Model_Relawan extends Model_Akun {
    private String nama, jabatan, kategori, organisasi, alamat;

    public void setJabatan(String jabatan) {
        this.jabatan = jabatan;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public void setOrganisasi(String organisasi) {
        this.organisasi = organisasi;
    }

    public String getNama() {
        return nama;
    }

    public String getAlamat() {
        return alamat;
    }

    public String getJabatan() {
        return jabatan;
    }

    public String getKategori() {
        return kategori;
    }

    public String getOrganisasi() {
        return organisasi;
    }
}
