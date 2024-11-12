
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {

  static TextStyle title = GoogleFonts.poppins(
    fontSize: 11.sp,
    color: ColorPalates.defaultWhite,
  );

  static TextStyle primary = GoogleFonts.poppins(
      fontSize: 8.sp,
      color: ColorPalates.defaultWhite,
      fontWeight: FontWeight.w600
  );

  static TextStyle secondary = GoogleFonts.poppins(
      fontSize: 6.sp,
      color: ColorPalates.defaultWhite,
  );

}