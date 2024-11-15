import 'package:feature_first/common/widgets/text_form_fields/input_border.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryTextFormFields extends StatelessWidget {
  const PrimaryTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [

        Text(
          'Full Name *',
          style: CustomTextStyles.secondary,
        ),

        gap2,

        TextFormField(
          style: CustomTextStyles.secondary,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorPalates.darkGrey,
            hintText: "Enter your name",
            hintStyle: CustomTextStyles.secondary,
            focusedBorder: primaryInputBorder,
            enabledBorder: primaryInputBorder,
            border: primaryInputBorder,
          ),
        ),
      ],
    );
  }
}
