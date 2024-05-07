import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:umkm_bloc/cubit/daftar_umkm_cubit.dart';
import 'package:umkm_bloc/cubit/umkm_cubit.dart';
import 'package:umkm_bloc/page/home_page.dart';

//model berisi data/state

//cubit untuk acvtivity model

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<umkmListCubit>(
            create: (_) => umkmListCubit(),
          ),
          BlocProvider<umkmCubit>(
            create: (_) => umkmCubit(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
