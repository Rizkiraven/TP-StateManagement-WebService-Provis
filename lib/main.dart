import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:valo_bloc/cubit/daftar_valo_cubit.dart';
import 'package:valo_bloc/cubit/valo_cubit.dart';
import 'package:valo_bloc/page/home_page.dart';

//model berisi data/state

//cubit untuk acvtivity model

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<valoListCubit>(
            create: (_) => valoListCubit(),
          ),
          BlocProvider<valoCubit>(
            create: (_) => valoCubit(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}