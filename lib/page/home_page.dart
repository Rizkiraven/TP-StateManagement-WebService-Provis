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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blue,
          title: Text(
            'My App',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                        '2205027, Muhammad Rizki Revandi\n2204343, Meiva Labibah Putri\nSaya berjanji tidak akan berbuat curang data atau membantu orang lain berbuat curang'),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<valoListCubit>().fetchData();
                      },
                      child: Text('Reload Daftar VALO'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    BlocBuilder<valoListCubit, List<valoModel>>(
                        buildWhen: (previousState, state) {
                      developer.log(
                          '${previousState[0].name}->${state[0].name}',
                          name: 'log');
                      return true;
                    }, builder: (context, valoList) {
                      return Container(
                        height: 500,
                        child: ListView.builder(
                          itemCount: valoList.length,
                          itemBuilder: (context, index) {
                            if (valoList[0].name != "") {
                              return ListTile(
                                  leading: Image.network(
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                  title: Text(valoList[index].name),
                                  subtitle: Text(valoList[index].role),
                                  trailing: Icon(Icons.more_vert_rounded),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      context
                                          .read<valoCubit>()
                                          .fetchData(valoList[index].id);
                                      return DetailValoPage();
                                    }));
                                  });
                            }
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}