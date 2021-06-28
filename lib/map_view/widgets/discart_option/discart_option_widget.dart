import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecoleta/core/app_colors.dart';
import 'package:ecoleta/core/app_text_styles.dart';

class DiscartOptionWidget extends StatefulWidget {
  final String label;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const DiscartOptionWidget({
    Key? key,
    required this.label,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  _DiscartOptionWidgetState createState() => _DiscartOptionWidgetState();
}

class _DiscartOptionWidgetState extends State<DiscartOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
              color: widget.isSelected ? AppColors.white : AppColors.aquaGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: widget.isSelected ? Colors.green : AppColors.white)),
          height: 104,
          width: 104,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network(widget.imagePath),
              SizedBox(height: 12),
              Text(
                widget.label,
                style: AppTextStyles.discartOption,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
