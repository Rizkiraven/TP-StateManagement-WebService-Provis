import 'package:valo_provider/provider/valo_state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ValoListProvider with ChangeNotifier {
  String url = "http://127.0.0.1:8000/daftar_agent_valo";
  List<ValoModel> _valoList = [
    ValoModel(
      id: "",
      name: "",
      realname: "",
      role: "",
      creature: "",
      image: "",
    )
  ];

  // Getter untuk mengakses valoList
  List<ValoModel> get valoList => _valoList;

  // Metode untuk mengubah valoList dari JSON
  void setFromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    _valoList = data.map((e) => ValoModel(
      id: e['id'],
      name: e['name'],
      realname: e['realname'],
      role: e['role'],
      creature: e['creature'],
      image: e['image'],
    )).toList();

    // Memberitahu listener (widget) bahwa ada perubahan dalam valoList
    notifyListeners();
  }

  // Metode untuk mengambil data dari API
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Jika sukses
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
