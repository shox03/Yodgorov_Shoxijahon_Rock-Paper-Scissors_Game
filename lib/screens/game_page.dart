import 'dart:math';

import 'package:exam/screens/liders_list.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, this.userName, this.rang, this.urunishlarSoni})
      : super(key: key);

  final String? userName;
  final Color? rang;
  final String? urunishlarSoni;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int botWiw = 0, userWin = 0;
  String? tanlanganBelgi;
  List<String> botRand = [
    "assets/right-rock.png",
    "assets/right-scissors.png",
    "assets/left-paper.png"
  ];
  String? botTanlaganBelggi, userTanlaganBelgiSoni;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Game Page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30.0),
          Row(
            children: [
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: 280,
                width: 170,
                child: Column(
                  children: [
                    Card(
                      color: Colors.tealAccent,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: widget.rang,
                          child: Icon(Icons.face),
                        ),
                        title: Text(
                          widget.userName.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Wins $userWin",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: [
                          DropdownMenuItem(
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.yellow,
                                  child: Image(
                                    image: AssetImage("assets/right-rock.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "Tosh",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            value: "1",
                          ),
                          DropdownMenuItem(
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Image(
                                    image:
                                        AssetImage("assets/right-scissors.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "Qaychi",
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                            value: "2",
                          ),
                          DropdownMenuItem(
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Image(
                                    image: AssetImage("assets/left-paper.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "Qog'oz",
                                  style: TextStyle(color: Colors.yellow),
                                )
                              ],
                            ),
                            value: "3",
                          ),
                        ],
                        hint: Text("Qog'oz, Qaychi, Tosh"),
                        value: tanlanganBelgi,
                        onChanged: (v) {
                          setState(
                            () {
                              tanlanganBelgi = v;
                              if (v == "1") {
                                userTanlaganBelgiSoni = "assets/right-rock.png";
                              } else if (v == "2") {
                                userTanlaganBelgiSoni =
                                    "assets/right-scissors.png";
                              } else if (v == "3") {
                                userTanlaganBelgiSoni = "assets/left-paper.png";
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                "VS",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: 280,
                width: 170,
                child: Column(
                  children: [
                    Card(
                      color: Colors.tealAccent,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: widget.rang,
                          child: Icon(Icons.face),
                        ),
                        title: Text(
                          "Bot",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Wins $botWiw",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.yellow,
                          child: Image(
                            image: AssetImage("$botTanlaganBelggi"),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text("Bot tanlagan belgi")
                      ],
                    )
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  if (botWiw == int.parse(widget.urunishlarSoni.toString()) ||
                      userWin == int.parse(widget.urunishlarSoni.toString())) {
                    windAniqla();
                  } else {
                    botTanlaganBelggi = botRand[Random().nextInt(3)];
                    if (userTanlaganBelgiSoni == botTanlaganBelggi) {
                      setState(() {
                        userWin += 1;
                        botWiw += 1;
                      });
                    }
                    if (userTanlaganBelgiSoni == "assets/right-rock.png" &&
                        botTanlaganBelggi == "assets/right-scissors.png") {
                      setState(() {
                        userWin += 1;
                      });
                    }
                    if (userTanlaganBelgiSoni == "assets/right-rock.png" &&
                        botTanlaganBelggi == "assets/left-paper.png") {
                      setState(() {
                        botWiw += 1;
                      });
                    }
                    if (userTanlaganBelgiSoni == "assets/right-scissors.png" &&
                        botTanlaganBelggi == "assets/left-paper.png") {
                      setState(() {
                        userWin += 1;
                      });
                    }
                    if (userTanlaganBelgiSoni == "assets/right-scissors.png" &&
                        botTanlaganBelggi == "assets/right-rock.png") {
                      setState(() {
                        botWiw += 1;
                      });
                    }
                    if (userTanlaganBelgiSoni == "assets/left-paper.png" &&
                        botTanlaganBelggi == "assets/right-rock.png") {
                      setState(() {
                        userWin += 1;
                      });
                    }
                    if (userTanlaganBelgiSoni == "assets/left-paper.png" &&
                        botTanlaganBelggi == "assets/right-scissors.png") {
                      setState(() {
                        botWiw += 1;
                      });
                    }
                  }
                });
              },
              child: Text("I'm readey"))
        ],
      ),
    );
  }

  windAniqla() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        winDialog(),
                        style: TextStyle(color: Colors.teal, fontSize: 23.0),
                      ),
                      SizedBox(height: 10),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LidersList(
                                  userName: widget.userName,
                                  rang: widget.rang,
                                  urunishlarSoni: userWin.toString(),
                                ),
                              ));
                        },
                        child: Text("Ok"),
                      )
                    ],
                  )));
        });
  }

  winDialog() {
    if (botWiw > userWin) {
      return "Bot yutdi";
    } else if (userWin > botWiw) {
      return "Siz yuttingiz!";
    } else {
      return "Teng";
    }
  }
}
