package sister.ayolelang.daftar.controller;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.widget.EditText;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import sister.ayolelang.login.model.Model_Akun;

import java.util.ArrayList;
import java.util.List;

public class Controller_Daftar {
    private Context context;
    private EditText Email, Password, Nama, Jabatan, Kategori, Organisasi, Alamat, NIK;
    private String email, password, tipe_daftar;
    private SharedPreferences pref;
    private SharedPreferences.Editor prefEdit;
    private Gson gson = new Gson();
    private List<Model_Akun> akunList = new ArrayList<>();

    public Controller_Daftar(Context context, SharedPreferences pref){
        this.pref = pref;
        this.context = context;
    }

    private void validasiInput(){
        email = Email.getText().toString();
        password = Password.getText().toString();
        if(email.isEmpty() || password.isEmpty()){
            if(email.isEmpty()) {
                Email.setError("Belum diisi");
            }
            if(password.isEmpty()){
                Password.setError("Belum diisi");
            }
        }else{
            Model_Akun akun = new Model_Akun();
            akun.setEmail(email);akun.setPassword(password);akun.setTipe(tipe_daftar);
            String response = pref.getString("akunLIST", "");
            if(response.equals("")){
                akunList.add(akun);
            }else{
                akunList = gson.fromJson(response, new TypeToken<List<Model_Akun>>(){}.getType());
                akunList.add(akun);
            }
            prefEdit = pref.edit();
            prefEdit.putString("akunLIST", gson.toJson(akunList));
            prefEdit.apply();
            Activity activity = (Activity)context;
            activity.finish();
        }
    }

    public void prepareAkun(EditText Email, EditText Password){
        this.Email = Email;
        this.Password = Password;
    }

    public void prepareAkun(EditText Nama, EditText NIK, EditText Alamat){
        this.Nama = Nama;
        this.NIK = NIK;
        this.Alamat = Alamat;
    }

    public void prepareAkun(EditText Nama, EditText Jabatan, EditText Kategori, EditText Organisasi, EditText Alamat){
        this.Nama = Nama;
        this.Jabatan = Jabatan;
        this.Kategori = Kategori;
        this.Organisasi = Organisasi;
        this.Alamat = Alamat;
    }

    public void proses(String tipe_daftar){
        this.tipe_daftar = tipe_daftar;
        validasiInput();
    }
}
