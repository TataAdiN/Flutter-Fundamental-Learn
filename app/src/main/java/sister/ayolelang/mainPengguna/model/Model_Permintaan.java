package sister.ayolelang.mainPengguna.model;

import sister.ayolelang.daftar.model.Model_Pengguna;

public class Model_Permintaan {
    String kategori, keadaan, lokasi;
    Model_Pengguna model_pengguna;

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public void setKeadaan(String keadaan) {
        this.keadaan = keadaan;
    }

    public void setLokasi(String lokasi) {
        this.lokasi = lokasi;
    }

    public void setModel_pengguna(Model_Pengguna model_pengguna) {
        this.model_pengguna = model_pengguna;
    }

    public String getKategori() {
        return kategori;
    }

    public Model_Pengguna getModel_pengguna() {
        return model_pengguna;
    }

    public String getKeadaan() {
        return keadaan;
    }

    public String getLokasi() {
        return lokasi;
    }
}
