import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class SpanButton extends StatelessWidget {

  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  const SpanButton({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainStart,
      children: [
        RichText(
            text: TextSpan(
                text: title,
                style: CustomTextStyles.secondary,
                children: [

                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: TextButton(
                          onPressed: onPressed,
                          child: Text(buttonText)
                      )
                  )
                ]
            )
        ),
      ],
    );
  }
}
