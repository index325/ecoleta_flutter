import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import 'package:ecoleta/map_view/models/item_model.dart';
import 'package:ecoleta/map_view/models/point_model.dart';
import 'package:ecoleta/map_view/service/map_service.dart';

part 'map_view_controller.g.dart';

class MapViewController = _MapViewControllerBase with _$MapViewController;

abstract class _MapViewControllerBase with Store {
  late MapService service;

  late String city = "";
  late String uf = "";

  _MapViewControllerBase({
    required this.service,
  });

  @observable
  late List<ItemModel> items = [];

  @observable
  ObservableList<int> selectedItems = ObservableList<int>();

  @observable
  late ObservableList<PointModel> points = ObservableList<PointModel>();

  @action
  handleIncrementItem(int i) async {
    if (!selectedItems.contains(i)) {
      selectedItems.add(i);
    } else {
      selectedItems.remove(i);
    }
    points = (await getUpdatedPoints()).asObservable();
  }

  Future<List<PointModel>> getUpdatedPoints() async {
    final List<int> list = selectedItems.toList();

    return await service.fetchPoints(
      itemsList: list,
      city: city,
      uf: uf,
    );
  }
}
