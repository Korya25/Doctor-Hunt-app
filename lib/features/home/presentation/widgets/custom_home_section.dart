import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeSection extends StatelessWidget {
  const CustomHomeSection({
    super.key,
    required this.headerSection,
    required this.horizontallistView,
  });
  final Widget headerSection;
  final Widget horizontallistView;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingH20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          headerSection,
          SizedBox(height: 10.h),
          horizontallistView,
        ],
      ),
    );
  }
}
