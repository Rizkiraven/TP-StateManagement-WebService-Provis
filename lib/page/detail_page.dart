import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valo_bloc/cubit/valo_cubit.dart';
import 'package:valo_bloc/cubit/valo_state.dart';
import 'dart:developer' as developer;

class DetailValoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Agent'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            BlocBuilder<valoCubit, valoModel>(
                buildWhen: (previousState, state) {
              developer.log('${previousState.name}->${state.name}',
                  name: 'log');
              return true;
            }, builder: (context, valoDetail) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          'Nama: ${valoDetail.name}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text('Nama Asli: ${valoDetail.realname}',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text("Role: ${valoDetail.role}",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text('Kelas: ${valoDetail.creature} ',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ));
  }
}