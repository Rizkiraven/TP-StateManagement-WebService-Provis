import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valo_provider/provider/valo_state.dart';
import 'package:valo_provider/provider/daftar_valo_provider.dart';
import 'package:valo_provider/provider/valo_provider.dart';
import 'dart:developer' as developer;

import 'package:valo_provider/page/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                      '2205027, Muhammad Rizki Revandi\n2204343, Meiva Labibah Putri\nSaya berjanji tidak akan berbuat curang data atau membantu orang lain berbuat curang',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<ValoListProvider>(context, listen: false)
                            .fetchData();
                      },
                      child: Text(
                        'Reload Daftar Agent Valo',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Consumer<ValoListProvider>(
                      builder: (context, valoListProvider, _) {
                        final valoList = valoListProvider.valoList;
                        return Container(
                          height: 500,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 2.00,
                            ),
                            itemCount: valoList.length,
                            itemBuilder: (context, index) {
                              if (valoList[0].name != "") {
                                return Card(
                                  color: Colors.black87,
                                  child: ListTile(
                                    leading: Image.asset(
                                        'images/${valoList[index].image}'),
                                    title: Text(
                                      valoList[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      valoList[index].role,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () {
                                      Provider.of<ValoProvider>(context,
                                              listen: false)
                                          .fetchData(valoList[index].id);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => DetailValoPage(),
                                        ),
                                      );
                                    },
                                  ),
                                );
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
    );
  }
}
