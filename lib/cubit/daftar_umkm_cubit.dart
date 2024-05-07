import 'package:umkm_bloc/cubit/umkm_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class umkmListCubit extends Cubit<List<umkmModel>> {
  String url = "http://127.0.0.1:8000/daftar_umkm";
  umkmListCubit()
      : super([
          umkmModel(
              id: "",
              name: "",
              type: "",
              memberSejak: "",
              omzetBulan: "",
              lamaUsaha: "")
        ]);

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    List<umkmModel> umkmList = data
        .map((e) => umkmModel(
            id: e['id'],
            name: e['name'],
            type: e['type'],
            memberSejak: e['member_sejak'],
            omzetBulan: e['omzet_bulan'],
            lamaUsaha: e['lama_usaha']))
        .toList();
    emit(umkmList);
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //sukses
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
