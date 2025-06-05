import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';
import 'package:morsl_app_celina0057/core/constant/padding.dart';
import 'package:morsl_app_celina0057/core/theme/theme_extension/color_scheme.dart';
import 'package:morsl_app_celina0057/provider/swipe_status_provider.dart';
import 'package:morsl_app_celina0057/src/common_widgets/common_widgets.dart';
import 'package:morsl_app_celina0057/src/common_widgets/src/auto_spacer.dart';
import 'package:morsl_app_celina0057/src/feature/home_screen/widgets/recipe_card_stack.dart';
import 'package:morsl_app_celina0057/src/feature/home_screen/widgets/show_status.dart';

import 'bottom_sheet_content/bottom_sheet_content.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSwipeUpdate(String direction) {
    ref.read(swipeStatusProvider.notifier).update(direction);
    if (direction == 'love') {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final direction = ref.watch(swipeStatusProvider);

    return Scaffold(
      backgroundColor: AppColorScheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Morsl', style: Theme.of(context).textTheme.titleLarge),
        actions: [
          GestureDetector(
            onTap: (){
              CommonWidget.openBottomSheet(context, BottomSheetContent());
            },
            child: Container(
              height: 40.r,
              width: 40.r,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColorScheme.secondaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: SvgPicture.asset(AppIcons.filterIcons),
            ),
          ),
          AutoSpacer(space: 16.w),
        ],
      ),
      body: Padding(
        padding: AppPadding.screenHorizontalPadding,
        child: Stack(
          children: [
            RecipeCardStack(onSwipe: _handleSwipeUpdate),
            if (direction != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: direction == 'love'
                    ? SlideTransition(
                  position: _slideAnimation,
                  child: ShowStatus(
                    key: ValueKey(direction),
                    path: getSwipeIconPath(direction),
                  ),
                )
                    : ShowStatus(
                  key: ValueKey(direction),
                  path: getSwipeIconPath(direction),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String getSwipeIconPath(String direction) {
    switch (direction) {
      case 'right':
        return 'assets/icons/new_check_mark.svg';
      case 'left':
        return 'assets/icons/cross.svg';
      case 'love':
        return 'assets/icons/love.svg';
      default:
        return '';
    }
  }

}

