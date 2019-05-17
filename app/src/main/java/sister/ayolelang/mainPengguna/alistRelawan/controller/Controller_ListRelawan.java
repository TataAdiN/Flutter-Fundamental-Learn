package sister.ayolelang.mainPengguna.alistRelawan.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import sister.ayolelang.daftar.model.Model_Relawan;
import sister.ayolelang.mainPengguna.model.Model_Permintaan;

import java.util.List;

public class Controller_ListRelawan {
    private Gson gson = new Gson();
    String data = "[\n" +
            "\t{\t\n" +
            "\t\t\"nama\" : \"Ramadhan Adi\",\n" +
            "\t\t\"email\" : \"rahmada@gmail.com\",\n" +
            "\t\t\"origanisasi\" : \"Nahdatul Ulama\",\n" +
            "\t\t\"kategori\":\"Ambulance\",\n" +
            "\t\t\"lokasi\":\"Jl. Parangtritis KM 9\"\n" +
            "\t},\n" +
            "\t{\n" +
            "\t\t\"nama\" : \"Nugroho Adi\",\n" +
            "\t\t\"email\" : \"nugrohoa@gmail.com\",\n" +
            "\t\t\"origanisasi\" : \"Puskesmas Sewon\",\n" +
            "\t\t\"kategori\":\"Ambulance\",\n" +
            "\t\t\"lokasi\":\"Jl. Parangtritis KM 9\"\n" +
            "\t}\n" +
            "]";
    private List<Model_Relawan> convertToObjek(){
        List<Model_Relawan> listRelawan = gson.fromJson(data, new TypeToken<List<Model_Relawan>>(){}.getType());
        return listRelawan;
    }

    public List<Model_Relawan> getRelawan(){
        return convertToObjek();
    }
}
