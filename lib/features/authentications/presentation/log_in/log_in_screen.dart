import 'package:feature_first/common/global/validation/forms_validation.dart';
import 'package:feature_first/common/widgets/buttons/primary_button.dart';
import 'package:feature_first/common/widgets/buttons/span_button.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/authentications/presentation/user_registration/registration_screen.dart';
import 'package:feature_first/features/dashboard/presentation/dashboard_screen.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogInScreen extends HookConsumerWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authenticationState = ref.watch(authenticationProvider);
    final authenticationCtrl = ref.read(authenticationProvider.notifier);

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

              gap24,

              FaIcon(
                FontAwesomeIcons.facebookMessenger,
                color: ColorPalates.defaultWhite,
                size: 50.sp,
              ),

              gap12,

              Text(
                "Sign In Account",
                style: CustomTextStyles.title,
              ),


              gap4,

              SizedBox(
                width: 1.sw / 1.3,
                child: Text(
                  "Log in to access your chats and stay connected instantly!",
                  style: CustomTextStyles.secondary,
                  textAlign: TextAlign.center,
                ),
              ),

              gap12,


              Form(
                key: formKey,
                child: Column(
                  children: [

                    PrimaryTextFormFields(
                      title: "Email",
                      hint: "Enter your email",
                      validator: (value)=> FormValidation(
                        formValue: authenticationState.emailController.text,
                        validationType: ValidationType.email
                      ).validate(),
                    ),


                    gap6,


                    PrimaryTextFormFields(
                      title: "Password",
                      hint: "******",
                      showObSecure: false,
                      validator: (value)=> FormValidation(
                        formValue: authenticationState.passwordController.text,
                        validationType: ValidationType.password
                      ).validate(),
                    ),
                  ],
                ),
              ),


              gap12,


              PrimaryButton(
                text: "Sign In",
                isLoading: authenticationState.isLoading,
                onPressed: ()async{
                  if(formKey.currentState!.validate()){
                    if(await authenticationCtrl.logInAccount()){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const DashboardScreen()));
                    }
                  }
                },
              ),

              SpanButton(
                  title: "Don't you have account",
                  buttonText: "Create Account",
                  onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> const RegistrationScreen()))
              )


            ],
          ),
        ),
      ),
    );
  }
}
