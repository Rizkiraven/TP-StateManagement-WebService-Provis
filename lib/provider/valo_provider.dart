import 'package:valo_provider/provider/valo_state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ValoProvider with ChangeNotifier {
  String url = "http://127.0.0.1:8000/detail_agent_valo/";
  ValoModel _valoModel = ValoModel(
    id: "",
    name: "",
    realname: "",
    role: "",
    creature: "",
    image: "",
  );

  // Getter untuk mengakses valoModel
  ValoModel get valoModel => _valoModel;

  // Method untuk mengubah valoModel dari JSON
  void setFromJson(Map<String, dynamic> json) {
    String id = json['id'];
    String name = json['name'];
    String realname = json['realname'];
    String role = json['role'];
    String creature = json['creature'];
    String image = json['image'];

    _valoModel = ValoModel(
      id: id,
      name: name,
      realname: realname,
      role: role,
      creature: creature,
      image: image,
    );

    // Memberitahu listener (widget) bahwa ada perubahan dalam valoModel
    notifyListeners();
  }

  // Method untuk mengambil data dari API
  Future<void> fetchData(String id) async {
    final response = await http.get(Uri.parse(url + id));
    if (response.statusCode == 200) {
      // Jika sukses
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
