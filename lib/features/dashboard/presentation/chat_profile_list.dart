import 'dart:math';

import 'package:feature_first/common/widgets/profile_widget.dart';
import 'package:feature_first/features/chat/presentation/chat_screen.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatProfileList extends StatelessWidget {
  const ChatProfileList({super.key});

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: 10,
      padding: paddingTop8,
      itemBuilder: (context,index)=>
          Material(
            color: Colors.transparent,
            child: Padding(
              padding: padding4,
              child: ListTile(
                onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> const ChatScreen())),
                contentPadding: paddingH4,
                leading: const ProfileWidget(),
                title: Text(
                  "James Edelen",
                  style: CustomTextStyles.primary,
                ),
                subtitle: Text(
                    "Here is another tutorial, if you...",
                  style: CustomTextStyles.secondary,
                ),
                trailing: Text(
                  "18 Mar",
                  style: CustomTextStyles.secondary,
                ),

              ),
            ),
          )
  );
}
