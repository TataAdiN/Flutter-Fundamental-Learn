package sister.ayolelang.mainPengguna.alistRelawan.view;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import sister.ayolelang.R;
import sister.ayolelang.mainPengguna.alistRelawan.adapter.listRelawanAdapter;
import sister.ayolelang.mainPengguna.alistRelawan.controller.Controller_ListRelawan;
import sister.ayolelang.mainRelawan.adapter.listPermintaanAdapter;

public class View_ListRelawan extends AppCompatActivity {
    private RecyclerView recyclerView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_list_relawan);
        recyclerView = findViewById(R.id.list_item);
        Controller_ListRelawan controller_listRelawan = new Controller_ListRelawan();
        listRelawanAdapter listRelawanAdapter = new listRelawanAdapter(controller_listRelawan.getRelawan());
        recyclerView.setAdapter(listRelawanAdapter);

        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getApplicationContext());
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
    }
}
