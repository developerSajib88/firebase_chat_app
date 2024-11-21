import 'package:feature_first/common/widgets/profile_widget.dart';
import 'package:feature_first/generated/assets.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const ProfileWidget(),

      gap6,

      Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            "James Edelen",
            style: CustomTextStyles.primary,
          ),
          Text(
              "Online",
            style: CustomTextStyles.secondary,
          )
        ],
      ),

      const Spacer(),

      InkWell(
        onTap: (){},
        child: Image.asset(
          Assets.iconsSearch,
          width: 14.w,
          height: 14.w,
        ),
      ),


    ],
  );
}
