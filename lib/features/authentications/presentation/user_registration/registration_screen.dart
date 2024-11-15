import 'package:feature_first/app/app.dart';
import 'package:feature_first/common/widgets/text_form_fields/input_border.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationScreen extends HookConsumerWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorPalates.background,
      body: Container(
        width: 1.sw,
        height: 1.sh,
        padding: padding6,
        child: Column(
          crossAxisAlignment: crossCenter,
          mainAxisAlignment: mainCenter,
          children: [

            FaIcon(
                FontAwesomeIcons.facebookMessenger,
              color: ColorPalates.defaultWhite,
              size: 50.sp,
            ),

            gap12,

            Text(
                "Create Account",
              style: CustomTextStyles.title,
            ),


            gap4,

            SizedBox(
              width: 1.sw / 1.2,
              child: Text(
                "Join the Conversation! Create Your Account to Chat, Share, and Stay Connected with Friends and Family.",
                style: CustomTextStyles.secondary,
                textAlign: TextAlign.center,
              ),
            ),

            gap12,

            PrimaryTextFormFields(),

            gap6,

            PrimaryTextFormFields(),



          ],
        ),
      ),
    );
  }
}
