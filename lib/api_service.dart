import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'library.dart';

class ApiService {
  final library = Library();

  static const String _baseUrl = "http://20.214.250.126";
  Future<bool> login(String id, String password) async {
    library.ToastMSG("통신전");
    final response = await http.post(
      Uri.parse('$_baseUrl'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': id, 'password': password}),
    );
    library.ToastMSG(response.statusCode.toString());

    if (response.statusCode == 200) {
      library.ToastMSG(response.body);
      // For example, you might want to store an access token.
      return true;
    } else {
      // You can handle different status codes and errors here
      return false;
    }
  }
}
