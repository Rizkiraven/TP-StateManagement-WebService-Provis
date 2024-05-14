import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valo_provider/provider/valo_provider.dart';
import 'package:valo_provider/provider/valo_state.dart';

class DetailValoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Detail Agent', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.red[400],
        width: double.infinity, // Ensure the container takes the full width of the screen
        child: Consumer<ValoProvider>(
          builder: (context, valoProvider, _) {
            final valoDetail = valoProvider.valoModel;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset('images/${valoDetail.image}', fit: BoxFit.cover),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Nama: ${valoDetail.name}',
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 7.0),
                          Text('Nama Asli: ${valoDetail.realname}',
                              style: const TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(height: 7.0),
                          Text("Role: ${valoDetail.role}",
                              style: const TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(height: 7.0),
                          Text('Kelas: ${valoDetail.creature}',
                              style: const TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(height: 7.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}