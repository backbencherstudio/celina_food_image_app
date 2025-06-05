import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';
import 'package:morsl_app_celina0057/core/constant/images.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/Riverpod/checkbox_provider.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/widgets/checkBox/customCheckBox.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/widgets/checkBox/customgridcheckbox.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/widgets/delete_button.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/widgets/glassBox.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final List<String> favList = [
      AppImages.foodpicOne,
      AppImages.foodpicTwo,
      AppImages.foodpicThree,
      AppImages.foodpicFour,
      AppImages.foodpicFive,
      AppImages.foodpicSix,
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Consumer(
          builder: (context, ref, _) {
            final checkState = ref.watch(checkProvider);
            final checkNotifier = ref.read(checkProvider.notifier);
            return Column(
              children: [
                SizedBox(height: 50.h),
                Row(
                  children: [
                    Text(
                      "Your Favorites",
                      style: style.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff4B4B4B),
                      ),
                    ),
                    Spacer(),
                    if (!checkState.isSelected)
                      Row(
                        children: [
                          CustomCheckbox(
                            isSelected: checkState.isSelected,
                            onTap: () {
                              checkNotifier.toggleSingle();
                            },
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "Select",
                            style: style.bodyMedium!.copyWith(
                              color: Color(0xff4B4B4B),
                            ),
                          ),
                        ],
                      ),

                    if (checkState.isSelected)
                      Row(
                        children: [
                          CustomCheckbox(
                            isSelected: checkState.isAllSelected,
                            onTap: () {
                              checkNotifier.toggleAll();
                            },
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "Select All",
                            style: style.bodyMedium!.copyWith(
                              color: Color(0xff4B4B4B),
                            ),
                          ),
                          SizedBox(width: 24.w),
                          DeleteButton(),
                        ],
                      ),
                  ],
                ),

                Expanded(
                  child: favList.isEmpty
                      ? SvgPicture.asset(Appicons.noFav)
                      : GridView.builder(
                          itemCount: favList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 15.h,
                                childAspectRatio: 2 / 3,
                              ),

                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(24.r),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.asset(
                                      favList[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  if (checkState.isSelected)
                                    Positioned(
                                      top: 13.h,
                                      right: 13.w,
                                      child: CustomGridCheckbox(
                                        isSelected: checkState.isAllSelected,

                                        onTap: () {
                                          checkNotifier.toggleSingle();
                                        },
                                      ),
                                    ),
                                  //blurr thingyyyy
                                  Positioned(
                                    bottom: -3,
                                    left: 0,
                                    right: 0,
                                    child: Glassbox(text: "Steak"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
