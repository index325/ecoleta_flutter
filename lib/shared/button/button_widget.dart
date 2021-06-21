import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ecoleta/core/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final dynamic icon;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;
  final bool enabled;

  const ButtonWidget({
    Key? key,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
    required this.enabled,
  }) : super(key: key);

  ButtonWidget.green({
    required String label,
    required VoidCallback onTap,
    required dynamic icon,
    required bool enabled,
  })  : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.onTap = onTap,
        this.icon = icon,
        this.enabled = enabled,
        this.label = label;

  ButtonWidget.white({
    required String label,
    required VoidCallback onTap,
    required dynamic icon,
    required bool enabled,
  })  : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.onTap = onTap,
        this.icon = icon,
        this.enabled = enabled,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              enabled ? backgroundColor : Colors.grey.shade300),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: enabled ? borderColor : Colors.white,
            ),
          ),
        ),
        onPressed: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: icon),
            Expanded(
              flex: 10,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: fontColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
