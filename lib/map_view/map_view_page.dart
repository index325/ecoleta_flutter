import 'package:ecoleta/core/app_colors.dart';
import 'package:ecoleta/core/app_images.dart';
import 'package:ecoleta/core/app_text_styles.dart';
import 'package:ecoleta/map_view/models/discard_option_model.dart';
import 'package:ecoleta/map_view/widgets/discart_option/discart_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:math' as math;

class MapViewPage extends StatefulWidget {
  const MapViewPage({Key? key}) : super(key: key);

  @override
  _MapViewPageState createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  Completer<GoogleMapController> _controller = Completer();

  List<DiscardOptionModel> discardOptions = [
    DiscardOptionModel(
        isSelected: false,
        name: "Resíduos Eletrônicos",
        imagePath: AppImages.eletronicos),
    DiscardOptionModel(
      isSelected: false,
      name: "Resíduos Eletrônicos",
      imagePath: AppImages.eletronicos,
    ),
  ];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.logout,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text(
                        "😃 Bem vindo.",
                        style: AppTextStyles.title20bold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        "Encontre no mapa um ponto de coleta.",
                        style: AppTextStyles.body,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
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
              children: discardOptions
                  .map((e) => DiscartOptionWidget(
                        imagePath: e.imagePath,
                        label: e.name,
                        isSelected: e.isSelected,
                        onTap: () {
                          e.isSelected = !e.isSelected;
                          setState(() {});
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
