import 'package:feature_first/common/widgets/profile_widget.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveProfileWidget extends StatelessWidget {
  const ActiveProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=> Padding(
            padding: paddingRight8,
            child: Column(
              children: [

                const ProfileWidget(),

                gap4,

                Text(
                  "Perez",
                  style: CustomTextStyles.secondary.copyWith(
                    fontWeight: FontWeight.normal
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
