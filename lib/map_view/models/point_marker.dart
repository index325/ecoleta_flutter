import 'package:ecoleta/core/app_colors.dart';
import 'package:ecoleta/map_view/models/point_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PointMarker extends Marker {
  final PointModel collectPoint;
  final double size;

  PointMarker({required this.collectPoint, required this.size})
      : super(
          anchorPos: AnchorPos.align(AnchorAlign.top),
          height: size,
          width: size,
          point: LatLng(collectPoint.latitude, collectPoint.longitude),
          builder: (BuildContext ctx) => Icon(
            Icons.location_on,
            color: AppColors.darkGreen,
          ),
        );
}
