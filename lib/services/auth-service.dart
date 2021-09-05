import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:pantofitpremiumapp/View/home_view.dart';
import 'dart:convert';

import 'package:pantofitpremiumapp/View/login_view.dart';


  const urlPrefix = 'https://pantofitv0.herokuapp.com';



  Future<int> postRegistration(String email,String password) async {
    final url = Uri.parse('$urlPrefix/register');
    final headers = {"Content-type": "application/json"};
    final jsond = '{"mail": "$email", "password":"$password"}';
    print(jsond);
    final response = await post(url, headers: headers, body: jsond);
    final jsonBody =await json.decode(response.body);
    LoginView.idClient=jsonBody['id'];
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    return response.statusCode;

  }
  Future<int> postLogin(String email,String password) async {
    final url = Uri.parse('$urlPrefix/login');
    final headers = {"Content-type": "application/json"};
    final jsond = '{"mail": "$email", "password":"$password"}';
    Response response = await post(url, headers: headers, body: jsond);
    final jsonBody = json.decode(response.body);
    LoginView.idClient=jsonBody['id'];
    return response.statusCode;
    print('ffrfzg:${LoginView.idClient}');
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

  }





