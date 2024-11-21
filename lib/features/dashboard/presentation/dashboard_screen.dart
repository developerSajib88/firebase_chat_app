import 'package:feature_first/features/dashboard/widgets/app_bar/dashboard_app_bar.dart';
import 'package:feature_first/common/widgets/profile_widget.dart';
import 'package:feature_first/features/dashboard/widgets/active_profile_widget.dart';
import 'package:feature_first/features/dashboard/presentation/chat_profile_list.dart';
import 'package:feature_first/generated/assets.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorPalates.background,
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [

              Padding(
                padding: padding4,
                child: Column(
                  crossAxisAlignment: crossStart,
                  children: [


                    DashboardAppBar(
                        name: "Sajib",
                        image: null
                    ),


                    gap12,

                    Text(
                      "RECENT",
                      style: CustomTextStyles.secondary.copyWith(
                        color: ColorPalates.defaultGrey,
                        letterSpacing: 2.w
                      ),
                    ),

                    gap6,

                    const ActiveProfileWidget()


                  ],
                ),
              ),


              Expanded(
                  child: Container(
                      width: 1.sw,
                      height: 1.sh,
                      decoration: BoxDecoration(
                          color: ColorPalates.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.r),
                            topRight: Radius.circular(25.r),
                          )
                      ),
                      padding: EdgeInsets.fromLTRB(6.w, 0, 6.w, 0),
                      child: const ChatProfileList()
                  ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
