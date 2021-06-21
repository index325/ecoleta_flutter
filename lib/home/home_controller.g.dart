// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool>? _$enableNextComputed;

  @override
  bool get enableNext =>
      (_$enableNextComputed ??= Computed<bool>(() => super.enableNext,
              name: '_HomeControllerBase.enableNext'))
          .value;

  final _$statesAtom = Atom(name: '_HomeControllerBase.states');

  @override
  List<StatesModel> get states {
    _$statesAtom.reportRead();
    return super.states;
  }

  @override
  set states(List<StatesModel> value) {
    _$statesAtom.reportWrite(value, super.states, () {
      super.states = value;
    });
  }

  final _$selectedStateAtom = Atom(name: '_HomeControllerBase.selectedState');

  @override
  String get selectedState {
    _$selectedStateAtom.reportRead();
    return super.selectedState;
  }

  @override
  set selectedState(String value) {
    _$selectedStateAtom.reportWrite(value, super.selectedState, () {
      super.selectedState = value;
    });
  }

  final _$citiesAtom = Atom(name: '_HomeControllerBase.cities');

  @override
  List<CitiesModel> get cities {
    _$citiesAtom.reportRead();
    return super.cities;
  }

  @override
  set cities(List<CitiesModel> value) {
    _$citiesAtom.reportWrite(value, super.cities, () {
      super.cities = value;
    });
  }

  final _$selectedCityAtom = Atom(name: '_HomeControllerBase.selectedCity');

  @override
  String get selectedCity {
    _$selectedCityAtom.reportRead();
    return super.selectedCity;
  }

  @override
  set selectedCity(String value) {
    _$selectedCityAtom.reportWrite(value, super.selectedCity, () {
      super.selectedCity = value;
    });
  }

  @override
  String toString() {
    return '''
states: ${states},
selectedState: ${selectedState},
cities: ${cities},
selectedCity: ${selectedCity},
enableNext: ${enableNext}
    ''';
  }
}
