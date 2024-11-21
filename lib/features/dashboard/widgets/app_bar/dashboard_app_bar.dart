import 'package:feature_first/generated/assets.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String name;
  final String? image;
  const DashboardAppBar({
    super.key,
    required this.name,
    required this.image
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainSpaceBetween,
      children: [

        Row(
          children: [

            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: ColorPalates.primary,
                  child: image != null ?
                  CircleAvatar(
                      radius: 12.r,
                      backgroundImage:  NetworkImage(
                        image ?? "",
                      )
                  )
                  : Text(
                    name[0].toUpperCase(),
                    style: CustomTextStyles.title,
                  )
                ),

                CircleAvatar(
                  radius: 5.r,
                  child: Icon(Icons.edit,size: 7.sp,),
                )

              ],
            ),

            gap6,

            Column(
              crossAxisAlignment: crossStart,
              children: [
                Text(
                  "Sajib Hasan",
                  style: CustomTextStyles.primary,
                )
              ],
            ),
          ],
        ),


        InkWell(
          onTap: (){},
          child: Image.asset(
            Assets.iconsSearch,
            width: 14.w,
            height: 14.w,
          ),
        )

      ],
    );
  }

}
