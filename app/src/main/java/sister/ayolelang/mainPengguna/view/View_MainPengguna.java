package sister.ayolelang.mainPengguna.view;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import sister.ayolelang.R;
import sister.ayolelang.mainPengguna.controller.Controller_MainPengguna;

public class View_MainPengguna extends AppCompatActivity implements View.OnClickListener {

    private EditText Kategori, Keadaan, Lokasi;
    private Button tombolBuat;

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            switch (item.getItemId()) {
                case R.id.navigation_home:
                    return true;
                case R.id.navigation_dashboard:
                    return true;
            }
            return false;
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_main_pengguna);

        Kategori = findViewById(R.id.pengguna_kategori);
        Keadaan = findViewById(R.id.pengguna_keadaan);
        Lokasi = findViewById(R.id.pengguna_lokasi);
        tombolBuat = findViewById(R.id.pengguna_buat);

        BottomNavigationView navigation = findViewById(R.id.navigation);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);

        tombolBuat.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        Controller_MainPengguna mainPengguna = new Controller_MainPengguna();
        if(view == tombolBuat){
            mainPengguna.buatPermintaan(Kategori, Keadaan, Lokasi);
        }
    }

}
