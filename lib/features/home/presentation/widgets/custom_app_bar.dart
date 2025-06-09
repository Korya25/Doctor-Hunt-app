import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIconsSvgs.backButtom, height: 30.h, width: 30.w),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
    );
  }
}
