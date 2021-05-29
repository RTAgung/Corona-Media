import 'package:corona_media/carousel_screen.dart';
import 'package:corona_media/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade700,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
                  child: FormLogin(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormLogin extends StatefulWidget {
  final TextStyle formLabelStyle = TextStyle(
    color: Colors.white,
  );

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          style: widget.formLabelStyle,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white),
            ),
            labelText: 'Username',
            labelStyle: widget.formLabelStyle,
          ),
          onChanged: (String value) {
            setState(() {
              _username = value;
            });
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          obscureText: true,
          style: widget.formLabelStyle,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white),
            ),
            labelText: 'Password',
            labelStyle: widget.formLabelStyle,
          ),
          onChanged: (String value) {
            setState(() {
              _password = value;
            });
          },
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            if (_username == "rtagung" && _password == "12345678") {
              Fluttertoast.showToast(
                  msg: "Login Success",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.green.shade400,
                  textColor: Colors.white,
                  fontSize: 12.0);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CarouselScreen()));
            }
            else {
              Fluttertoast.showToast(
                  msg: "Login Failed",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red.shade300,
                  textColor: Colors.white,
                  fontSize: 12.0);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
