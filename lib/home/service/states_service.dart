import 'package:ecoleta/home/models/states_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<StatesModel> fetchStates() async {
  final response = await http.get(
      Uri.https('servicodados.ibge.gov.br', '/api/v1/localidades/estados'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return StatesModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load states');
  }
}
