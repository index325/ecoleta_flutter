import 'dart:convert';
import 'package:ecoleta/map_view/models/point_model.dart';
import 'package:http/http.dart' as http;

class MapService {
  Future<List<PointModel>> fetchPoints({
    required List<int> itemsList,
    required String city,
    required String uf,
  }) async {
    final response = await http.get(Uri.http('10.0.2.2:3333', '/points', {
      'city': city,
      "uf": uf,
      "items": itemsList,
    }));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);

      return jsonResponse.map((model) => PointModel.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load states');
    }
  }
}
