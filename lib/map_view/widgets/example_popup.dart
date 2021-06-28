import 'package:ecoleta/core/app_colors.dart';
import 'package:ecoleta/core/app_text_styles.dart';
import 'package:ecoleta/detail/models/detail_arguments.dart';
import 'package:ecoleta/map_view/models/point_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ExamplePopup extends StatelessWidget {
  final PointModel marker;

  ExamplePopup(this.marker, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Card(
        color: AppColors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              "/point",
              arguments: DetailArguments(id: marker.id),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: marker.imageUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  marker.name,
                  style: AppTextStyles.pointName,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
