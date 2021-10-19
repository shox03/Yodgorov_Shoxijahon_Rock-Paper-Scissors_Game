import 'dart:convert';
import 'dart:math';

import 'package:exam/data/users_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LidersList extends StatefulWidget {
  const LidersList({Key? key, this.userName, this.rang, this.urunishlarSoni})
      : super(key: key);

  final String? userName;
  final Color? rang;
  final String? urunishlarSoni;

  @override
  _LidersListState createState() => _LidersListState();
}

class _LidersListState extends State<LidersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ListTile(
            //   leading: CircleAvatar(
            //     backgroundColor: widget.rang,
            //     child: Icon(Icons.face),
            //   ),
            //   title: Text(widget.userName.toString()),
            //   subtitle: Text("${widget.urunishlarSoni} win"),
            //   trailing: (Icon(Icons.info)),
            // ),
            FutureBuilder(
              future: _getData(),
              builder: (context, AsyncSnapshot<List<UsersClass>> snap) {
                var data = snap.data;
                return snap.hasData
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,

                        height: 500,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListView.builder(
                              itemCount: data!.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    child: Icon(Icons.face),
                                    backgroundColor:
                                        Colors.teal[Random().nextInt(9) * 100],
                                  ),
                                  title: Text(data[index].username.toString()),
                                  subtitle: Text("$index win"),
                                  trailing: (Icon(Icons.info)),
                                );
                              },
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<UsersClass>> _getData() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => UsersClass.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato Bor ${res.statusCode}");
    }
  }
}
