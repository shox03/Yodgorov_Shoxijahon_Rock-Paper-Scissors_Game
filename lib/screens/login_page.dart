import 'package:exam/widgets/app_bar_widget.dart';
import 'package:exam/widgets/form_widget.dart';
import 'package:exam/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? tanlanganRang;
  Color colorOfIcon = Colors.white;
  var _formKey = GlobalKey<FormState>();
  var _userNameController = TextEditingController();
  var _urunishlarSoni = TextEditingController();

  int? pass = 123456;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              FormWidget(),
              buildimage(),
            ],
          ),
        ),
      ),
    );
  }
}
