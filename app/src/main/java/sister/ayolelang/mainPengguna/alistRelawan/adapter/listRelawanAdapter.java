package sister.ayolelang.mainPengguna.alistRelawan.adapter;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import sister.ayolelang.R;
import sister.ayolelang.daftar.model.Model_Pengguna;
import sister.ayolelang.daftar.model.Model_Relawan;
import sister.ayolelang.mainPengguna.model.Model_Permintaan;
import sister.ayolelang.mainRelawan.adapter.listPermintaanAdapter;

import java.util.ArrayList;
import java.util.List;

public class listRelawanAdapter extends RecyclerView.Adapter<listRelawanAdapter.MyViewHolder>  {
    List<Model_Relawan> listRelawan = new ArrayList<>();
    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView Nama, Email, Kategori, Organisasi, Lokasi;
        public MyViewHolder(View view) {
            super(view);
            Nama = view.findViewById(R.id.list_relawan_nama);
            Email = view.findViewById(R.id.list_relawan_email);
            Kategori = view.findViewById(R.id.list_relawan_kategori);
            Organisasi = view.findViewById(R.id.list_relawan_organisasi);
            Lokasi = view.findViewById(R.id.list_relawan_lokasi);
        }
    }
    public listRelawanAdapter(List<Model_Relawan> listRelawan) {
        this.listRelawan = listRelawan;
    }
    public @NonNull
    listRelawanAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.view_permintaan_listrelawan, parent, false);
        return new listRelawanAdapter.MyViewHolder(itemView);
    }
    public void onBindViewHolder(@NonNull listRelawanAdapter.MyViewHolder holder, int position) {
        Model_Relawan relawan = listRelawan.get(position);
        holder.Email.setText(relawan.getEmail());
        holder.Nama.setText(relawan.getNama());
        holder.Kategori.setText(relawan.getKategori());
        holder.Organisasi.setText(relawan.getOrganisasi());
        holder.Lokasi.setText(relawan.getAlamat());
    }
    public int getItemCount() {
        return listRelawan.size();
    }
}