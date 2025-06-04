import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffF4F1EC),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Settings",
          style: style.headlineSmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: Color(0xff4B4B4B),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Column(children: [

           ],
           
       
        ),
      ),
    );
  }
}
