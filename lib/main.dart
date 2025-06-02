import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morsl_app_celina0057/core/theme/app_theme.dart';
import 'data/routes/route_import_part.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Posse',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          //darkTheme: AppTheme.darkTheme,
          routerConfig: RouteConfig().goRouter,
        );
      },
    );
  }
}
