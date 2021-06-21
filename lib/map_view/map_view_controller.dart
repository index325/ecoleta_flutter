import 'package:mobx/mobx.dart';

import 'package:ecoleta/map_view/models/item_model.dart';
import 'package:ecoleta/map_view/models/point_model.dart';
import 'package:ecoleta/map_view/service/map_service.dart';

part 'map_view_controller.g.dart';

class MapViewController = _MapViewControllerBase with _$MapViewController;

abstract class _MapViewControllerBase with Store {
  late MapService service;

  _MapViewControllerBase({
    required this.service,
  });

  @observable
  late List<ItemModel> items = [];

  @observable
  late List<int> selectedItems = [];

  @observable
  late List<PointModel> points = [];
}
