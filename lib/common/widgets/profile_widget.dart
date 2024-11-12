import 'dart:math';

import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileWidget extends HookConsumerWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [

        CircleAvatar(
            radius: 15.r,
            backgroundImage: const NetworkImage(
              "https://img.freepik.com/free-photo/smiling-superhero-man-optical-glasses-with-red-cloak-isolated-white-wall_141793-95694.jpg",
            )
        ),

        Positioned(
          bottom: 2.w,
          child: CircleAvatar(
            radius: 3.r,
            backgroundColor: Random().nextInt(4).isEven ?Colors.green : ColorPalates.defaultGrey,
          ),
        )

      ],
    );
  }
}
