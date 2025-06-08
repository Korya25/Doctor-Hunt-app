import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/core/widgets/search_input_field.dart';
import 'package:doctor_hunt/core/widgets/Cached_network_image_with_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.userName,
    required this.userImage,
    this.headerHeight = 156,
    this.bottomRadius = 26,
    this.horizontalPadding = 20,
  });

  final String userName;
  final String userImage;
  final double headerHeight;
  final double bottomRadius;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Header Background
        Container(
          height: headerHeight.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(bottomRadius.r),
              bottomRight: Radius.circular(bottomRadius.r),
            ),
          ),
        ),
        // Header Content
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
          child: SizedBox(
            height: headerHeight.h,
            child: Row(
              children: [
                buildText(),
                const Spacer(),
                ClipOval(
                  child: CachedNetworkImageWithShimmer(imageUrl: userImage),
                ),
              ],
            ),
          ),
        ),
        // Search Field
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: AppPadding.paddingH20,
            child: const SearchInputField(hintText: AppString.searchHint),
          ),
        ),
      ],
    );
  }

  Widget buildText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${AppString.hi} $userName!',
          style: AppTextStyles.rubikLight20Secondary,
        ),
        SizedBox(height: 4.h),
        Text(
          AppString.findYourDoctor,
          style: AppTextStyles.rubikBold25Secondary,
        ),
      ],
    );
  }
}
