package sister.ayolelang.login.view;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v4.content.ContextCompat;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import sister.ayolelang.R;
import sister.ayolelang.login.controller.Controller_Login;

public class View_Login extends Activity implements View.OnClickListener {
    private TextView daftarRelawan, daftarPengguna;
    private Button tombolLogin;
    private Controller_Login controller_Login;
    private EditText Email, Password;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        SharedPreferences pref = getSharedPreferences("cache_ada", MODE_PRIVATE);
        controller_Login = new Controller_Login(View_Login.this, pref);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        daftarRelawan = findViewById(R.id.login_daftarRelawan);
        daftarPengguna = findViewById(R.id.login_daftarPengguna);
        Email = findViewById(R.id.login_kolomEmail);
        Password = findViewById(R.id.login_kolomPassword);
        tombolLogin = findViewById(R.id.login_tombolLogin);

        getWindow().setStatusBarColor(ContextCompat.getColor(getApplicationContext(), R.color.darkerWhite));

        daftarRelawan.setOnClickListener(this);
        daftarPengguna.setOnClickListener(this);
        tombolLogin.setOnClickListener(this);
    }
    @Override
    public void onClick(View view) {
        if(view == daftarRelawan){
            controller_Login.daftarRelawan();
        } else if(view == daftarPengguna){
            controller_Login.daftarPengguna();
        }else if(view == tombolLogin){
            controller_Login.loginAkun(Email, Password);
        }
    }
}
