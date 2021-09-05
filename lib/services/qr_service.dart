import 'dart:convert';

import 'package:http/http.dart';
import 'package:pantofitpremiumapp/View/login_view.dart';
const urlPrefix = 'https://pantofitv0.herokuapp.com';

Future<void> postValidationScan(String code) async {
  final url = Uri.parse('$urlPrefix/validatesalle');
  final headers = {"Content-type": "application/json"};
  final jsond = '{"code": "$code", "id":"${LoginView.idClient}"}';
  print(jsond);
  final response = await post(url, headers: headers, body: jsond);
  final jsonBody = json.decode(response.body);
  print(jsonBody);
  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');

}
