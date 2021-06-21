import 'package:ecoleta/map_view/map_view_controller.dart';
import 'package:ecoleta/map_view/models/arguments_model.dart';
import 'package:ecoleta/map_view/service/map_service.dart';
import 'package:ecoleta/map_view/widgets/discart_option/discart_option_widget.dart';
import 'package:ecoleta/map_view/widgets/map_view_appbar.dart';
import 'package:ecoleta/map_view/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapViewPage extends StatefulWidget {
  const MapViewPage({Key? key}) : super(key: key);

  @override
  _MapViewPageState createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  Completer<GoogleMapController> _controller = Completer();
  final service = MapService();
  final controller = MapViewController(service: MapService());

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as ArgumentsModel;

      getPoints(arguments);
    });

    super.initState();
  }

  getPoints(args) async {
    // print(await service.fetchPoints(
    //   itemsList: [],
    //   city: args.city,
    //   uf: args.uf,
    // ));
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
          child: MapWidget(kGooglePlex: _kGooglePlex, controller: _controller),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 40),
        child: Container(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.only(right: 24),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: controller.items
                  .map((e) => DiscartOptionWidget(
                        imagePath: e.imageUrl,
                        label: e.title,
                        isSelected: false,
                        onTap: () {
                          print("teste");
                        },
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
