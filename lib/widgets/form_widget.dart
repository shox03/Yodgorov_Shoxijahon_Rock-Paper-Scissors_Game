import 'package:exam/screens/game_page.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String? tanlanganRang;
  Color colorOfIcon = Colors.white;
  var _formKey = GlobalKey<FormState>();
  var _userNameController = TextEditingController();
  var _urunishlarSoni = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                validator: (text) {
                  if (text!.length < 4) {
                    return "4 ta belgidan kam bo'lmasin";
                  }
                },
                controller: _userNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "User name"),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.text,
                validator: (text) {
                  if (text!.length > 1 && text != int) {
                    return "Faqat bit xonalik son kiritish mumkin";
                  }
                },
                controller: _urunishlarSoni,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Urunishlar soni"),
              ),
              SizedBox(height: 10.0),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      child: Row(
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.face),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "White",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      value: "oq",
                    ),
                    DropdownMenuItem(
                      child: Row(
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.orangeAccent,
                            child: Icon(Icons.face),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "Orange",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      value: "orange",
                    ),
                    DropdownMenuItem(
                      child: Row(
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(Icons.face),
                          ),
                          SizedBox(width: 10.0),
                          Text("Black")
                        ],
                      ),
                      value: "qora",
                    ),
                    DropdownMenuItem(
                      child: Row(
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(Icons.face),
                          ),
                          SizedBox(width: 10.0),
                          Text("Green"),
                        ],
                      ),
                      value: "yashil",
                    ),
                  ],
                  hint: Text("User icon rangini tanlang"),
                  value: tanlanganRang,
                  onChanged: (v) {
                    setState(
                      () {
                        tanlanganRang = v;
                        if (v == "oq") {
                          colorOfIcon = Colors.white;
                        } else if (v == "qora") {
                          colorOfIcon = Colors.black;
                        } else if (v == "yashil") {
                          colorOfIcon = Colors.green;
                        } else if (v == "orange") {
                          colorOfIcon = Colors.orangeAccent;
                        }
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Save"),
                    SizedBox(width: 10.0),
                    Icon(Icons.save),
                  ],
                ),
                onPressed: buttonSave,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Delete"),
                    SizedBox(width: 10.0),
                    Icon(Icons.restart_alt),
                  ],
                ),
                onPressed: buttonClear,
              ),
            ],
          ),
        ),
      ),
    );
  }
    buttonSave() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        // int? son = int.parse(_urunishlarSoni.toString());
        // debugPrint("$son eeeeeeeeeeeeeeee");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GamePage(
                userName: _userNameController.text,
                rang: colorOfIcon,
                urunishlarSoni: _urunishlarSoni.text,
              ),
            ));
      });
    }
  }

  buttonClear() {
    _formKey.currentState!.reset();
  }
}

