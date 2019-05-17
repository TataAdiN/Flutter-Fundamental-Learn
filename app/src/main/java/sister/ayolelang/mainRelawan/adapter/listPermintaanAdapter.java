package sister.ayolelang.mainRelawan.adapter;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import sister.ayolelang.R;
import sister.ayolelang.daftar.model.Model_Pengguna;
import sister.ayolelang.mainPengguna.model.Model_Permintaan;

import java.util.ArrayList;
import java.util.List;

public class listPermintaanAdapter extends RecyclerView.Adapter<listPermintaanAdapter.MyViewHolder>  {
    List<Model_Permintaan> listPermintaan = new ArrayList<>();
    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView Nama, Email, Kategori, Keadaan, Lokasi;
        public MyViewHolder(View view) {
            super(view);
            Nama = view.findViewById(R.id.list_permintaan_nama);
            Email = view.findViewById(R.id.list_permintaan_email);
            Kategori = view.findViewById(R.id.list_permintaan_kategori);
            Keadaan = view.findViewById(R.id.list_permintaan_keadaan);
            Lokasi = view.findViewById(R.id.list_permintaan_lokasi);
        }
    }
    public listPermintaanAdapter(List<Model_Permintaan> listPermintaan) {
        this.listPermintaan = listPermintaan;
    }
    public @NonNull
    listPermintaanAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.view_permintaan_listadapter, parent, false);
        return new listPermintaanAdapter.MyViewHolder(itemView);
    }
    public void onBindViewHolder(@NonNull listPermintaanAdapter.MyViewHolder holder, int position) {
        Model_Permintaan permintaan = listPermintaan.get(position);
        Model_Pengguna pengguna = permintaan.getModel_pengguna();
        holder.Email.setText(pengguna.getEmail());
        holder.Nama.setText(pengguna.getNama());
        holder.Kategori.setText(permintaan.getKategori());
        holder.Keadaan.setText(permintaan.getKeadaan());
        holder.Lokasi.setText(permintaan.getLokasi());
    }
    public int getItemCount() {
        return listPermintaan.size();
    }
}
