import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final bool? isLoading;
  final String text;
  final VoidCallback onPressed;
  const PrimaryButton({
    super.key,
    this.isLoading,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
      splashColor: Colors.green,
      highlightColor: Colors.transparent,
      child: Container(
        width: 1.sw,
        height: 30.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorPalates.primary,
          borderRadius: radius4,
        ),
        child: isLoading ?? true ?
        Text(
          text,
          style: CustomTextStyles.primary,
        ) :SizedBox(
          width: 15.w,
          height: 15.w,
          child: const CircularProgressIndicator(
            color: Colors.white,
          ),
        ),

      ),
    );
  }
}
