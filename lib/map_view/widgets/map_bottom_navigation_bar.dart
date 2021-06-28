import 'package:ecoleta/map_view/map_view_controller.dart';
import 'package:ecoleta/map_view/widgets/discart_option/discart_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MapBottomNavigationBar extends StatelessWidget {
  const MapBottomNavigationBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MapViewController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 40),
      child: Container(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Observer(
            builder: (context) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: controller.items
                    .asMap()
                    .map(
                      (i, e) => MapEntry(
                        i,
                        DiscartOptionWidget(
                          imagePath: e.imageUrl,
                          label: e.title,
                          isSelected: controller.selectedItems.contains(e.id),
                          onTap: () {
                            controller.handleIncrementItem(e.id);
                          },
                        ),
                      ),
                    )
                    .values
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
