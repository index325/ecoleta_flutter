import 'package:ecoleta/map_view/map_view_controller.dart';
import 'package:ecoleta/map_view/models/point_marker.dart';
import 'package:ecoleta/map_view/widgets/example_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/extension_api.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latlong2/latlong.dart';

class MapWithPopups extends StatefulWidget {
  final MapViewController controller;

  const MapWithPopups({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _MapWithPopupsState createState() => _MapWithPopupsState();
}

class _MapWithPopupsState extends State<MapWithPopups> {
  final PopupController _popupLayerController = PopupController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return FlutterMap(
          options: MapOptions(
            center: LatLng(-13.4678604, -51.4492071),
            zoom: 4,
          ),
          children: [
            TileLayerWidget(
              options: TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
            ),
            PopupMarkerLayerWidget(
              options: PopupMarkerLayerOptions(
                markers: widget.controller.points
                    .map((e) => PointMarker(
                          collectPoint: e,
                          size: 40,
                        ))
                    .toList(),
                popupController: _popupLayerController,
                popupBuilder: (BuildContext context, Marker marker) {
                  if (marker is PointMarker) {
                    return ExamplePopup(marker.collectPoint);
                  }

                  return Card(child: Text('Not a monument'));
                },
                markerRotateAlignment:
                    PopupMarkerLayerOptions.rotationAlignmentFor(
                  AnchorAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
