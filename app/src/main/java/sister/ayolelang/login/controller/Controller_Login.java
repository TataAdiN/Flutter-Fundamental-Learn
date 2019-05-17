package sister.ayolelang.login.controller;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import android.widget.EditText;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import sister.ayolelang.MainActivity;
import sister.ayolelang.daftar.view.View_DaftarPengguna;
import sister.ayolelang.daftar.view.View_DaftarRelawan;
import sister.ayolelang.login.model.Model_Akun;
import sister.ayolelang.mainPengguna.view.View_MainPengguna;
import sister.ayolelang.mainRelawan.view.View_MainRelawan;

import java.util.List;

public class Controller_Login {
    private EditText Email, Password;
    private Context context;
    private String email, password;
    private SharedPreferences pref;
    private SharedPreferences.Editor prefEdit;
    private Gson gson = new Gson();

    public Controller_Login(Context context, SharedPreferences pref){
        this.pref = pref;
        this.context = context;
    }

    private void autentikasiLogin(){
        String response = pref.getString("akunLIST", "");
        Log.d("TAG","response = " + response);
        List<Model_Akun> akunList = gson.fromJson(response, new TypeToken<List<Model_Akun>>(){}.getType());
        int i = 0;
        for(Model_Akun akun : akunList){
            akun = akunList.get(i);
            if (akun.getEmail().equals(email) && akun.getPassword().equals(password)){
                if (akun.getTipe().equals("RELAWAN")){
                    context.startActivity(new Intent(context, View_MainRelawan.class));
                }else{
                    context.startActivity(new Intent(context, View_MainPengguna.class));
                }

                break;
            }
            i++;
        }
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
            autentikasiLogin();
            //context.startActivity(new Intent(context, MainActivity.class));
        }
    }
    public void loginAkun(EditText Email, EditText Password){
        this.Email = Email;
        this.Password = Password;
        validasiInput();
    }
    public void daftarPengguna(){
        context.startActivity(new Intent(context, View_DaftarPengguna.class));
    }
    public void daftarRelawan(){
        context.startActivity(new Intent(context, View_DaftarRelawan.class));
    }

}
