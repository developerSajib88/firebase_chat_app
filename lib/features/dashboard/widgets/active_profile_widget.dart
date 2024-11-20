import 'package:feature_first/common/widgets/profile_widget.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/chat/presentation/chat_screen.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActiveProfileWidget extends HookConsumerWidget {
  const ActiveProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final dashboardState = ref.watch(dashboardProvider);
    final dashboardCtrl = ref.watch(dashboardProvider.notifier);

    return SizedBox(
      height: 60.h,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=> Padding(
            padding: paddingRight8,
            child: GestureDetector(
              onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> const ChatScreen())),
              child: Column(
                children: [
              
                  const ProfileWidget(),
              
                  gap4,
              
                  Text(
                    dashboardState.users?[index].fullName ?? "",
                    style: CustomTextStyles.secondary.copyWith(
                      fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
