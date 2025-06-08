import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/core/widgets/Cached_network_image_with_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PopularDoctorCard extends StatelessWidget {
  const PopularDoctorCard({
    super.key,
    required this.onTap,
    required this.docName,
    required this.docCategory,
    required this.docImage,
    required this.docRating,
  });

  final VoidCallback onTap;
  final String docName;
  final String docCategory;
  final String docImage;
  final double docRating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(12.r),
          color: const Color.fromARGB(240, 255, 255, 255),
          child: SizedBox(
            width: 180.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 180.h,
                  child: CachedNetworkImageWithShimmer(imageUrl: docImage),
                ),
                PopularDoctorDetailCard(
                  docName: docName,
                  docCategory: docCategory,
                  docRating: docRating,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopularDoctorDetailCard extends StatelessWidget {
  const PopularDoctorDetailCard({
    super.key,
    required this.docName,
    required this.docCategory,
    required this.docRating,
  });

  final String docName;
  final String docCategory;
  final double docRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryColor,
      padding: AppPadding.paddingH8V8,
      child: Column(
        spacing: 3.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            docName,
            style: AppTextStyles.rubik18MediumPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            docCategory,
            style: AppTextStyles.rubik12LightTertiary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          RatingBarIndicator(
            rating: docRating,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemSize: 13.sp,
            itemBuilder: (context, index) => SvgPicture.asset(
              AppIconsSvgs.star,
              width: 13.sp,
              height: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
