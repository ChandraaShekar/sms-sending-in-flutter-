import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String url;
  var Data;

  String QueryText = 'Query';
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('PYTHON AND FLUTTER'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Name"
                    ),
                  ),
                  TextField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Number",
                      prefixText: "+91 "
                    ),
                  ),
                  RaisedButton(
                      child: Text("Click Me"),
                      onPressed: () {
                        http.post("http://192.168.0.10:5000/api",
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8'
                            },
                            body: jsonEncode(<String, String>{
                              'title': 'sms',
                              'name': nameController.text,
                              'num': '+91' + numberController.text
                            }));
                      }),
                ],
              ),
            ),
          )),
    );
  }
}
