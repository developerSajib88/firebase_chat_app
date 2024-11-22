import 'package:feature_first/common/global/functions/global_functions.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/generated/assets.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardAppBar extends HookConsumerWidget implements PreferredSizeWidget{
  const DashboardAppBar({
    super.key,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authenticationState = ref.watch(authenticationProvider);
    final authenticationCtrl = ref.watch(authenticationProvider.notifier);

    Future updateProfilePicture()async{
      GlobalFunctions.pickProfileImage().then((file){
        if(file != null){
          authenticationCtrl.updateProfilePicture(imageFile: file);
        }
      });
    }

    return Row(
      mainAxisAlignment: mainSpaceBetween,
      children: [

        Row(
          children: [

            InkResponse(
              onTap: ()=> updateProfilePicture(),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 15.r,
                    backgroundColor: ColorPalates.primary,
                    child: authenticationState.userModel != null ?
                    CircleAvatar(
                        radius: 12.r,
                        backgroundImage:  NetworkImage(
                          authenticationState.userModel?.profileImage ?? "",
                        )
                    )
                    : Text(
                      authenticationState.userModel!.fullName![0].toUpperCase(),
                      style: CustomTextStyles.title,
                    )
                  ),

                  CircleAvatar(
                    radius: 5.r,
                    child: Icon(Icons.edit,size: 7.sp,),
                  )

                ],
              ),
            ),

            gap6,

            Column(
              crossAxisAlignment: crossStart,
              children: [
                Text(
                  authenticationState.userModel!.fullName!,
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
