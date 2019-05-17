package sister.ayolelang.daftar.view;

import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import sister.ayolelang.R;
import sister.ayolelang.daftar.controller.Controller_Daftar;

public class View_DaftarRelawan extends AppCompatActivity implements View.OnClickListener {
    private EditText Email, Password;
    private Button tombolDaftar;
    private Controller_Daftar controller_Daftar;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        SharedPreferences pref = getSharedPreferences("cache_ada", MODE_PRIVATE);
        controller_Daftar = new Controller_Daftar(View_DaftarRelawan.this, pref);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_daftar_relawan);

        Email = findViewById(R.id.daftar_relawan_email);
        Password = findViewById(R.id.daftar_relawan_password);
        tombolDaftar = findViewById(R.id.daftar_relawan);

        tombolDaftar.setOnClickListener(this);
    }
    @Override
    public void onClick(View view) {
        if(view == tombolDaftar){
            controller_Daftar.prepareAkun(Email, Password);
            controller_Daftar.proses("RELAWAN");
        }
    }
}
