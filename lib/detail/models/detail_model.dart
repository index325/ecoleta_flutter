import 'package:ecoleta/detail/models/detail_items_model.dart';
import 'package:ecoleta/map_view/models/point_model.dart';

class DetailModel {
  final PointModel point;
  final List<DetailItemsModel> items;

  DetailModel({
    required this.point,
    required this.items,
  });

  factory DetailModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['items'] as List;
    List<DetailItemsModel> itemsList =
        list.map((i) => DetailItemsModel.fromJson(i)).toList();

    return DetailModel(
      items: itemsList,
      point: PointModel.fromJson(parsedJson['point']),
    );
  }
}
