import 'package:feature_first/common/widgets/text_form_fields/input_border.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryTextFormFields extends StatelessWidget {
  final String title;
  final String hint;
  final bool? showObSecure;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PrimaryTextFormFields({
    super.key,
    this.showObSecure,
    this.validator,
    this.keyboardType,
    this.controller,
    required this.title,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [

        Text(
          "$title *",
          style: CustomTextStyles.secondary,
        ),

        gap2,

        TextFormField(
          controller: controller,
          style: CustomTextStyles.secondary,
          obscureText: showObSecure ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorPalates.darkGrey,
            hintText: hint,
            hintStyle: CustomTextStyles.secondary.copyWith(color: ColorPalates.lightGrey),
            focusedBorder: primaryInputBorder,
            enabledBorder: primaryInputBorder,
            border: primaryInputBorder,
            suffixIcon: showObSecure != null ? Icon(
             showObSecure ?? false ?
             Icons.visibility_outlined
                 : Icons.visibility_off_outlined,
              color: ColorPalates.primary,
             ): null
          ),
          validator: validator,
        ),
      ],
    );
  }
}
