import 'package:feature_first/features/authentications/presentation/log_in/log_in_screen.dart';
import 'package:feature_first/features/authentications/presentation/user_registration/registration_screen.dart';
import 'package:feature_first/features/dashboard/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatApp extends HookConsumerWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(187.5,406),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child)=> const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LogInScreen(),
      ),
      // builder: (BuildContext context, Widget? child) => MaterialApp.router(
      //   title: "Feature-First",
      //   debugShowCheckedModeBanner: false,
      //   // theme: AppTheme.themeData,
      //   // themeMode: ThemeMode.light,
      //   // routerConfig: router,
      // ),
    );
  }
}
