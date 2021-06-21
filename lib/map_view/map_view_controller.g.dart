// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapViewController on _MapViewControllerBase, Store {
  final _$itemsAtom = Atom(name: '_MapViewControllerBase.items');

  @override
  List<ItemModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<ItemModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$selectedItemsAtom =
      Atom(name: '_MapViewControllerBase.selectedItems');

  @override
  List<int> get selectedItems {
    _$selectedItemsAtom.reportRead();
    return super.selectedItems;
  }

  @override
  set selectedItems(List<int> value) {
    _$selectedItemsAtom.reportWrite(value, super.selectedItems, () {
      super.selectedItems = value;
    });
  }

  final _$pointsAtom = Atom(name: '_MapViewControllerBase.points');

  @override
  List<PointModel> get points {
    _$pointsAtom.reportRead();
    return super.points;
  }

  @override
  set points(List<PointModel> value) {
    _$pointsAtom.reportWrite(value, super.points, () {
      super.points = value;
    });
  }

  @override
  String toString() {
    return '''
items: ${items},
selectedItems: ${selectedItems},
points: ${points}
    ''';
  }
}
