import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morsl_app_celina0057/core/constant/images.dart';
import 'package:morsl_app_celina0057/core/theme/theme_extension/color_scheme.dart';
import 'package:morsl_app_celina0057/src/common_widgets/src/auto_spacer.dart';
import 'package:morsl_app_celina0057/src/feature/home_screen/home_screen.dart';
import '../../../provider/splash_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final splashState = ref.watch(splashProvider);

    return splashState.when(data: (data) {
      if (data) {
        return HomeScreen();
      }
      return Container();
    }, error: (error, stackTrace) {
      return Scaffold(
        body: Center(child: Text("Error loading splash screen")),
      );
    }, loading: (){
      return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AutoSpacer(space: 370.h),
                  Center(child: Image.asset(AppImages.logo, width: 74.w)),
                  Text(
                    'Morsl',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColorScheme.primaryColor,
                    ),
                  ),
                  AutoSpacer(space: 48.h),
                  Text(
                      'Swipe. Crave. Choose',
                      style: textTheme.titleMedium
                  ),
                  AutoSpacer(space: 160.h),
                  Text('V1.0'),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SvgPicture.asset('assets/images/splash_screen/Circle.svg'),
            )
          ],
        ),
      );
    });
  }
}
