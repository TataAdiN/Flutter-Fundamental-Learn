package sister.ayolelang.mainRelawan.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import sister.ayolelang.mainPengguna.model.Model_Permintaan;

import java.util.List;

public class Controller_MainRelawan {
    private Gson gson = new Gson();
    String data = "[\n" +
            "\t{\t\n" +
            "\t\t\"kategori\":\"Kecelakaan\",\n" +
            "\t\t\"keadaan\":\"Terluka Parah, tak sadarkan diri\",\n" +
            "\t\t\"lokasi\":\"Jl. Wates KM 5\",\n" +
            "\t\t\"model_pengguna\" : {\n" +
            "\t\t\t\"email\" : \"tataa2237@gmail.com\",\n" +
            "\t\t\t\"nama\" : \"Tata Adi Nugroho\"\n" +
            "\t\t}\n" +
            "\t},\n" +
            "\t{\n" +
            "\t\t\"kategori\":\"Pemakaman\",\n" +
            "\t\t\"keadaan\":\"Pemakaman Senin 20 Mei 2019\",\n" +
            "\t\t\"lokasi\":\"Jl. Parangtritis KM 5\",\n" +
            "\t\t\"model_pengguna\" : {\n" +
            "\t\t\t\"email\" : \"adi@gmail.com\",\n" +
            "\t\t\t\"nama\" : \"Adi Hidayat\"\n" +
            "\t\t}\n" +
            "\t}\n" +
            "]";
    private List<Model_Permintaan> convertToObjek(){
        List<Model_Permintaan> permintaanList = gson.fromJson(data, new TypeToken<List<Model_Permintaan>>(){}.getType());
        return permintaanList;
    }

    public List<Model_Permintaan> getPermintaan(){
        return convertToObjek();
    }
}
