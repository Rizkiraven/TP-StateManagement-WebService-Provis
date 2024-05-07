import 'package:umkm_bloc/cubit/umkm_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class umkmCubit extends Cubit<umkmModel> {
  String url = "http://127.0.0.1:8000/detil_umkm/";
  umkmCubit()
      : super(umkmModel(
            id: "",
            name: "",
            type: "",
            memberSejak: "",
            omzetBulan: "",
            lamaUsaha: ""));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    String id = json['id'];
    String name = json['name'];
    String type = json['type'];
    String memberSejak = json['member_sejak'];
    String omzetBulan = json['omzet_bulan'];
    String lamaUsaha = json['lama_usaha'];
//emit state baru, ini berbeda dgn provider!
    emit(umkmModel(
        id: id,
        name: name,
        type: type,
        memberSejak: memberSejak,
        omzetBulan: omzetBulan,
        lamaUsaha: lamaUsaha));
  }

  void fetchData(String id) async {
    final response = await http.get(Uri.parse(url + id));
    if (response.statusCode == 200) {
      //sukses
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
