import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response>Getdata(url) async {
  return http.post(url,
  headers: <String, String>{
    'Content-Type' : 'application/json; charset=UTF-8'
  },
  body: jsonEncode(<String,String>{
    'title': 'sms',
    'name':'Arun',
    'num':'+917032052374'

  })
  );
//  http.Response Response = await http.post(url);
//  return Response.body;
}
