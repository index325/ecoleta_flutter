import 'package:ecoleta/home/models/cities_model.dart';
import 'package:ecoleta/home/models/states_model.dart';
import 'package:ecoleta/home/service/location_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  late LocationService service;

  _HomeControllerBase({required this.service});

  @observable
  late List<StatesModel> states = [];

  @observable
  late String selectedState = "";

  @observable
  late List<CitiesModel> cities = [];

  @observable
  late String selectedCity = "";

  @computed
  bool get enableNext {
    return selectedCity.isNotEmpty && selectedState.isNotEmpty;
  }
}
