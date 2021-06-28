import 'dart:convert';
import 'package:ecoleta/detail/models/detail_model.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

class DetailService {
  Future<DetailModel> fetchDetail({
    required int id,
  }) async {
    final response = await http.get(Uri.http('10.0.2.2:3333', '/points/$id'));

    if (response.statusCode == 200) {
      final decode = json.decode(response.body);

      DetailModel detailModel = new DetailModel.fromJson(decode);

      print(detailModel);

      return detailModel;
    } else {
      throw Exception('Failed to load states');
    }
  }
}
