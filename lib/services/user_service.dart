import 'dart:convert';
import 'package:http/http.dart';
import 'package:pantofitpremiumapp/View/login_view.dart';


const urlPrefix = 'https://pantofitv0.herokuapp.com';

Future<int> postNombreSeancesRestantes() async{
  final url = Uri.parse('$urlPrefix/abonnementclient');
  final headers = {"Content-type": "application/json"};
  final jsond = '{"id": "${LoginView.idClient}"}';
  print(jsond);
  print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
  final response = await post(url, headers: headers, body: jsond);
  final jsonBody = json.decode(response.body);
  print(jsonBody);
  final nbrSeancesRestantes = jsonBody["nbrseancerestants"];
  print(nbrSeancesRestantes);
  return nbrSeancesRestantes;

}