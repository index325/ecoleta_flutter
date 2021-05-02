import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.roboto(
    color: AppColors.purple,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle title20 = GoogleFonts.roboto(
    color: AppColors.purple,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle title20bold = GoogleFonts.roboto(
    color: AppColors.purple,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body = GoogleFonts.roboto(
    color: AppColors.grey,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyBold = GoogleFonts.roboto(
    color: AppColors.grey,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle discartOption = GoogleFonts.roboto(
    color: AppColors.purple,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle detailTags = GoogleFonts.roboto(
    color: AppColors.green,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static final TextStyle detailTitleAddress = GoogleFonts.roboto(
    color: AppColors.purple,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle detailBodyAddress = GoogleFonts.roboto(
    color: AppColors.purple,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 2,
  );
}
