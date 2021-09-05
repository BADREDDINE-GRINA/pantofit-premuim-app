import 'dart:convert';

import 'package:http/http.dart';

const urlPrefix = 'https://pantofitv0.herokuapp.com';

Future<String> getSalle(int id) async {
  final url = Uri.parse('$urlPrefix/salles/$id');
  Response response = await get(url);
  final jsonBody = json.decode(response.body);
  String nom = jsonBody['name'];
  print('nom: ${nom}');
  print('Status code: ${response.statusCode}');
  print('Headers: ${response.headers}');
  print('Body: ${response.body}');
  return nom;
}

Future<String> getSalleName(int id) async{
  final url = Uri.parse('$urlPrefix/salles/$id');
  Response response = await get(url);
  final jsonBody = await json.decode(response.body);
  print('body: $jsonBody');
  return jsonBody['name'];
}
Future<String> getSalleVille(int id) async{
  final url = Uri.parse('$urlPrefix/salles/$id/ville');
  Response response = await get(url);
  final jsonBody = json.decode(response.body);
  String ville= jsonBody['name'];
  print('ville:$ville');
  return ville;

}

