import 'package:mobx/mobx.dart';

import 'package:ecoleta/detail/models/detail_items_model.dart';
import 'package:ecoleta/map_view/models/item_model.dart';
import 'package:ecoleta/map_view/models/point_model.dart';

part 'detail_controller.g.dart';

class DetailController = _DetailControllerBase with _$DetailController;

abstract class _DetailControllerBase with Store {
  @observable
  late PointModel point = PointModel(
    id: 0,
    longitude: 0,
    latitude: 0,
    imageUrl: "",
    name: "",
    image: "",
    address: "",
  );

  @observable
  late List<DetailItemsModel> items = [
    DetailItemsModel(
      title: "",
      id: 0,
      image: "",
      pointId: 0,
      itemId: 0,
    ),
  ];

  _DetailControllerBase();
}
