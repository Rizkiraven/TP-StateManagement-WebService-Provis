import 'package:valo_bloc/cubit/valo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class valoListCubit extends Cubit<List<valoModel>> {
  String url = "http://127.0.0.1:8000/daftar_valo";
  valoListCubit()
      : super([
          valoModel(
              id: "",
              name: "",
              realname: "",
              role: "",
              creature: "")
        ]);

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    List<valoModel> valoList = data
        .map((e) => valoModel(
            id: e['id'],
            name: e['name'],
            realname: e['realname'],
            role: e['role'],
            creature: e['creature']))
        .toList();
    emit(valoList);
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