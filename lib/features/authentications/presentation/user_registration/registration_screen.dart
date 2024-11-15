import 'package:feature_first/common/widgets/buttons/primary_button.dart';
import 'package:feature_first/common/widgets/buttons/span_button.dart';
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
        padding: padding12,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: crossCenter,
            mainAxisAlignment: mainCenter,
            children: [

              gap12,
          
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
          
              const PrimaryTextFormFields(
                title: "Full Name",
                hint: "Enter your full name",
              ),
          
              gap6,
          
              const PrimaryTextFormFields(
                title: "Email",
                hint: "Enter your email",
              ),
          
          
              gap6,
          
          
              const PrimaryTextFormFields(
                title: "Password",
                hint: "******",
                showObSecure: false,
              ),
          
              gap6,
          
              const PrimaryTextFormFields(
                title: "Confirm Password",
                hint: "******",
                showObSecure: false,
              ),
          
              gap12,
          
              PrimaryButton(
                text: "Create Account",
                onPressed: (){},
              ),
          
              SpanButton(
                  title: "Do you have already account",
                  buttonText: "Log In",
                  onPressed: (){}
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
}
