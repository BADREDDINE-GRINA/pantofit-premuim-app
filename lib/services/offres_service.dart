import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';


const urlPrefix = 'https://pantofitv0.herokuapp.com';

Future<int> getNbrTicketOffre(int id) async {
  final url = Uri.parse('$urlPrefix/plans/$id');
  Response response = await get(url);
  final jsonBody = json.decode(response.body);
  int nbrticket = jsonBody['nbrticket'];
  print(nbrticket);
  return nbrticket;
}


Future<int> getMontantOffre(int id) async {
  final url = Uri.parse('$urlPrefix/plans/$id');
  Response response = await get(url);
  final jsonBody = json.decode(response.body);
  print(jsonBody);
  int montant = jsonBody['montant'].toInt();
  print('montant: $montant');
  return montant;
}