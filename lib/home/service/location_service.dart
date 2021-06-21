import 'package:ecoleta/home/models/cities_model.dart';
import 'package:ecoleta/home/models/states_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationService {
  Future<List<StatesModel>> fetchStates() async {
    final response = await http.get(
        Uri.https('servicodados.ibge.gov.br', '/api/v1/localidades/estados'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);

      return jsonResponse.map((model) => StatesModel.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load states');
    }
  }

  Future<List<CitiesModel>> fetchCities(stateUf) async {
    final response = await http.get(Uri.https('servicodados.ibge.gov.br',
        '/api/v1/localidades/estados/$stateUf/municipios'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);

      return jsonResponse.map((model) => CitiesModel.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }
}
