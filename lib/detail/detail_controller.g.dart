// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailController on _DetailControllerBase, Store {
  final _$pointAtom = Atom(name: '_DetailControllerBase.point');

  @override
  PointModel get point {
    _$pointAtom.reportRead();
    return super.point;
  }

  @override
  set point(PointModel value) {
    _$pointAtom.reportWrite(value, super.point, () {
      super.point = value;
    });
  }

  final _$itemsAtom = Atom(name: '_DetailControllerBase.items');

  @override
  List<DetailItemsModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<DetailItemsModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  @override
  String toString() {
    return '''
point: ${point},
items: ${items}
    ''';
  }
}
