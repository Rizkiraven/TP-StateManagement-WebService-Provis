import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:valo_provider/provider/daftar_valo_provider.dart';
import 'package:valo_provider/provider/valo_provider.dart';
import 'package:valo_provider/page/home_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ValoListProvider()),
        ChangeNotifierProvider(create: (_) => ValoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}