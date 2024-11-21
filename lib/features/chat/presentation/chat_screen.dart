import 'package:feature_first/app/app.dart';
import 'package:feature_first/features/chat/widget/app_bar/chat_app_bar.dart';
import 'package:feature_first/generated/assets.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalates.background,
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: padding6,
          child: Column(
            children: [

             const ChatAppBar(),

             gap6,

             Expanded(
                 child: ListView.builder(
                     itemCount: 15,
                     itemBuilder: (context, index)=>
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             width: 1.sw,
                             alignment: index.isEven ? Alignment.centerLeft : Alignment.centerRight,
                             child: SizedBox(
                               width: 1.sw / 1.5,
                               child: Container(
                                 padding: padding8,
                                 decoration: BoxDecoration(
                                   color: index.isEven ? ColorPalates.primary : ColorPalates.darkGrey,
                                   borderRadius: BorderRadius.only(
                                     topLeft: Radius.circular(10.r),
                                     topRight: Radius.circular(10.r),
                                     bottomLeft: index.isEven ? Radius.circular(0.r) : Radius.circular(10.r),
                                     bottomRight: index.isEven ? Radius.circular(10.r) : Radius.circular(0.r),
                                   )
                                 ),
                                 child: Text(
                                   "I commented on Figma, I want to add some fancy icons. Do you have any icon set?",
                                   style: CustomTextStyles.secondary,
                                 ),
                               ),
                             ),
                           ),
                         )
                 )
             ),


             gap6,


             TextFormField(
               style: CustomTextStyles.secondary,
               decoration: InputDecoration (
                 filled: true,
                 fillColor: ColorPalates.primary,
                 hintText: "Message",
                 hintStyle: CustomTextStyles.secondary,
                 contentPadding: padding4,
                 enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(100.r),
                     borderSide: const BorderSide(color: Colors.transparent)
                 ),
                 focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(100.r),
                     borderSide: const BorderSide(color: Colors.transparent)
                 ),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(100.r),
                   borderSide: const BorderSide(color: Colors.transparent)
                 ),
                 prefixIcon: Padding(
                   padding: padding4,
                   child: Container(
                     width: 8.w,
                     height: 8.w,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                         color: ColorPalates.darkGrey,
                         shape: BoxShape.circle),
                     child: Material(
                       color: Colors.transparent,
                       child: InkWell(
                         onTap: (){},
                         splashColor: Colors.green,
                         borderRadius: radiusCircle,
                         child: SizedBox(
                           width: 1.sw,
                           height: 1.sh,
                           child: Icon(
                             Icons.camera_alt_outlined,
                             color: ColorPalates.lightGrey,
                           ),
                         ),
                       ),
                     ),
                   ),
                 ),
                 suffixIcon: Padding(
                   padding: padding4,
                   child: Container(
                     width: 8.w,
                     height: 8.w,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                         color: ColorPalates.darkGrey,
                         shape: BoxShape.circle),
                     child: Material(
                       color: Colors.transparent,
                       child: InkWell(
                         onTap: (){},
                         splashColor: Colors.green,
                         borderRadius: radiusCircle,
                         child: Container(
                           width: 1.sw,
                           height: 1.sh,
                           padding: EdgeInsets.only(right: 2.w),
                           child: Center(
                             child: Image.asset(
                               Assets.iconsSend,
                               width: 15.w,
                               height: 15.w,
                             ),
                           ),
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
             ),


            ],
          ),
        ),
      ),
    );
  }
}
