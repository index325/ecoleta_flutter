import 'package:ecoleta/map_view/map_view_controller.dart';
import 'package:ecoleta/map_view/models/arguments_model.dart';
import 'package:ecoleta/map_view/service/map_service.dart';
import 'package:ecoleta/map_view/widgets/map_bottom_navigation_bar.dart';
import 'package:ecoleta/map_view/widgets/map_view_appbar.dart';
import 'package:ecoleta/map_view/widgets/map_with_popups_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({Key? key}) : super(key: key);

  @override
  _MapViewPageState createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  final service = MapService();
  final controller = MapViewController(service: MapService());

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as ArgumentsModel;
      getItems();
      getPoints(arguments);
    });

    super.initState();
  }

  getPoints(ArgumentsModel args) async {
    controller.city = args.city;
    controller.uf = args.uf;

    controller.points = (await service.fetchPoints(
      itemsList: [],
      city: args.city,
      uf: args.uf,
    ))
        .asObservable();
  }

  getItems() async {
    controller.items = await service.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: MapViewAppbar(),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: MapWithPopups(controller: controller),
        ),
      ),
      bottomNavigationBar: MapBottomNavigationBar(controller: controller),
    );
  }
}
