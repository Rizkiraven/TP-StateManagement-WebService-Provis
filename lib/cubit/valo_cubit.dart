import 'package:valo_bloc/cubit/valo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class valoCubit extends Cubit<valoModel> {
  String url = "http://127.0.0.1:8000/detail_agent_valo/";
  valoCubit()
      : super(valoModel(
            id: "",
            name: "",
            realname: "",
            role: "",
            creature: "",
            image: ""));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    String id = json['id'];
    String name = json['name'];
    String realname = json['realname'];
    String role = json['role'];
    String creature = json['creature'];
    String image = json['image'];
//emit state baru, ini berbeda dgn provider!
    emit(valoModel(
        id: id,
        name: name,
        realname: realname,
        role: role,
        creature: creature,
        image: image));
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