import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valo_bloc/cubit/daftar_valo_cubit.dart';
import 'package:valo_bloc/cubit/valo_cubit.dart';
import 'package:valo_bloc/cubit/valo_state.dart';
import 'dart:developer' as developer;

import 'package:valo_bloc/page/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => valoListCubit()..fetchData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text(
              'Data Agent Valorant',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Container(
              color: Colors.red[400],
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Text(
                        '2205027, Muhammad Rizki Revandi\n2204343, Meiva Labibah Putri\nKami berjanji tidak akan berbuat curang data atau membantu orang lain berbuat curang',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      BlocBuilder<valoListCubit, List<valoModel>>(
                        buildWhen: (previousState, state) {
                          developer.log(
                              '${previousState[0].name}->${state[0].name}',
                              name: 'log');
                          return true;
                        },
                        builder: (context, valoList) {
                          return Container(
                            // Mengatur tinggi Container agar tidak terlalu memanjang ke bawah
                            height: 500,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    2, // Menentukan jumlah kolom dalam grid
                                crossAxisSpacing: 10.0, // Jarak antar kolom
                                mainAxisSpacing: 10.0, // Jarak antar baris
                                childAspectRatio:
                                    2.00,
                              ),
                              itemCount: valoList.length,
                              itemBuilder: (context, index) {
                                if (valoList[0].name != "") {
                                  return Card(
                                    color: Colors
                                        .black87, // Ubah warna latar belakang card sesuai kebutuhan
                                    child: ListTile(
                                      leading: Image.asset(
                                          'images/${valoList[index].image}'),
                                      title: Text(
                                        valoList[index].name,
                                        overflow: TextOverflow
                                            .ellipsis, // Memotong teks yang terlalu panjang
                                        maxLines: 1, // Maksimum 1 baris teks
                                        textAlign:
                                            TextAlign.center, // Pusatkan teks
                                        style: TextStyle(
                                          fontSize: 12.0, // Ukuran teks responsif
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Text(
                                        valoList[index].role,
                                        overflow: TextOverflow
                                            .ellipsis, // Memotong teks yang terlalu panjang
                                        maxLines: 1, // Maksimum 1 baris teks
                                        textAlign:
                                            TextAlign.center, // Pusatkan teks
                                        style: TextStyle(
                                          fontSize: 10.0, // Ukuran teks responsif
                                          color: Colors.white,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) {
                                          context
                                              .read<valoCubit>()
                                              .fetchData(valoList[index].id);
                                          return DetailValoPage();
                                        }));
                                      },
                                    ),
                                  );
                                } else {
                                  return Container(); // Placeholder widget if name is empty
                                }
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
