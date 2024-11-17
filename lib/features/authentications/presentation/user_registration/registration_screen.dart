import 'package:feature_first/common/global/validation/forms_validation.dart';
import 'package:feature_first/common/widgets/buttons/primary_button.dart';
import 'package:feature_first/common/widgets/buttons/span_button.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/authentications/presentation/log_in/log_in_screen.dart';
import 'package:feature_first/features/dashboard/presentation/dashboard_screen.dart';
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
          
              Form(
                key: formKey,
                child: Column(
                  children: [

                    PrimaryTextFormFields(
                      controller: authenticationState.nameController,
                      title: "Full Name",
                      hint: "Enter your full name",
                      validator: (value)=> FormValidation(
                        formValue: authenticationState.nameController.text,
                        validationType: ValidationType.name
                      ).validate(),
                    ),

                    gap6,

                    PrimaryTextFormFields(
                      controller: authenticationState.emailController,
                      title: "Email",
                      hint: "Enter your email",
                      validator: (value)=> FormValidation(
                         formValue: authenticationState.emailController.text,
                         validationType: ValidationType.email
                      ).validate()
                    ),


                    gap6,


                    PrimaryTextFormFields(
                      controller: authenticationState.passwordController,
                      title: "Password",
                      hint: "******",
                      showObSecure: false,
                      validator: (value)=> FormValidation(
                        formValue: authenticationState.passwordController.text,
                        validationType: ValidationType.password
                      ).validate(),
                    ),

                    gap6,

                    PrimaryTextFormFields(
                      title: "Confirm Password",
                      hint: "******",
                      showObSecure: false,
                      validator: (value){
                        if(authenticationState.passwordController.text != value) {
                          return "Confirm password does't not match";
                        }else{
                         return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
          
              gap12,
          
              PrimaryButton(
                text: "Create Account",
                isLoading: authenticationState.isLoading,
                onPressed: ()async{
                  if(formKey.currentState!.validate()){
                    await authenticationCtrl.createAccount().then((value){
                      if(value) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const DashboardScreen()));
                    });
                  }
                },
              ),
          
              SpanButton(
                  title: "Do you have already account",
                  buttonText: "Log In",
                  onPressed: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LogInScreen()))
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
}
