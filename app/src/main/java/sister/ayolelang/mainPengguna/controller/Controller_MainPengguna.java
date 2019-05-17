package sister.ayolelang.mainPengguna.controller;

import android.widget.EditText;

public class Controller_MainPengguna {
    private EditText Kategori, Keadaan, Lokasi;
    private void validasiInput(){
        String kategori, keadaan, lokasi;
        kategori = Kategori.getText().toString();
        keadaan = Keadaan.getText().toString();
        lokasi = Lokasi.getText().toString();
        if(kategori.isEmpty() || keadaan.isEmpty() || lokasi.isEmpty()){
            if(kategori.isEmpty()){
                Kategori.setError("Belum diisi");
            }
            if(keadaan.isEmpty()){
                Keadaan.setError("Belum diisi");
            }
            if(lokasi.isEmpty()){
                Lokasi.setError("Belum diisi");
            }
        }else{

        }
    }

    public void buatPermintaan(EditText Kategori,EditText Keadaan,EditText Lokasi){
        this.Kategori = Kategori;
        this.Keadaan = Keadaan;
        this.Lokasi = Lokasi;
        validasiInput();
    }
}
