package sister.ayolelang.mainRelawan.view;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.MenuItem;
import android.widget.TextView;
import sister.ayolelang.R;
import sister.ayolelang.mainRelawan.adapter.listPermintaanAdapter;
import sister.ayolelang.mainRelawan.controller.Controller_MainRelawan;

import static java.security.AccessController.getContext;

public class View_MainRelawan extends AppCompatActivity {
    private RecyclerView recyclerView;
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
        setContentView(R.layout.activity_view_main_relawan);
        recyclerView = findViewById(R.id.list_item);
        BottomNavigationView navigation = findViewById(R.id.navigation);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);

        Controller_MainRelawan controller_mainRelawan = new Controller_MainRelawan();
        listPermintaanAdapter listPermintaanAdapter = new listPermintaanAdapter(controller_mainRelawan.getPermintaan());
        recyclerView.setAdapter(listPermintaanAdapter);

        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getApplicationContext());
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
    }

}
