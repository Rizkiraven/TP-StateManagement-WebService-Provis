import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valo_provider/provider/valo_provider.dart';
import 'package:valo_provider/provider/valo_state.dart';

class DetailValoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Agent'),
        centerTitle: true,
      ),
      body: Consumer<ValoProvider>(
        builder: (context, valoProvider, _) {
          final valoDetail = valoProvider.valoModel;
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
                    Text(
                      'Nama Asli: ${valoDetail.realname}',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Role: ${valoDetail.role}',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Kelas: ${valoDetail.creature}',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
