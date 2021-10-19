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
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.face),
                backgroundColor: widget.rang,
              ),
              title: Text(widget.userName.toString()),
              subtitle: Text("${widget.urunishlarSoni.toString()} Wins"),
              trailing: Icon(
                Icons.info,
                color: Colors.greenAccent,
              ),
            ),
            FutureBuilder(
              future: _getData(),
              builder: (context, AsyncSnapshot<List<Post>> snap) {
                var data = snap.data;
                return snap.hasData
                    ? Container(
                        height: 500,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                child: Icon(Icons.face),
                                backgroundColor:
                                    Colors.teal[Random().nextInt(9) * 100],
                              ),
                              title: Text(data![index].username.toString()),
                              subtitle: Text(data[index].name.toString()),
                              trailing: Icon(
                                Icons.info,
                                color: Colors.greenAccent,
                              ),
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
        )),
      ),
    );
  }

  Future<List<Post>> _getData() async {
    final res = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    );
    if (res.statusCode == 200) {
      return (jsonDecode(res.body) as List)
          .map((e) => Post.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
