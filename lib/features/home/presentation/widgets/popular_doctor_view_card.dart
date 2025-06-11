import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_rating_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorViewCard extends StatelessWidget {
  final DoctorModel doctor;

  const PopularDoctorViewCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.h,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 104.h,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Stack(
          children: [
            buildDoctorInfo(),
            Align(
              alignment: Alignment.topRight,
              child: FavoriteButton(height: 17.h),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDoctorInfo() {
    return Row(
      spacing: 12.w,
      children: [
        SizedBox(
          width: 85.w,
          height: 85.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImageWithShimmer(imageUrl: doctor.image),
          ),
        ),
        buildDoctorDetails(),
      ],
    );
  }

  Widget buildDoctorDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            doctor.name,
            style: AppTextStyles.rubik18MediumPrimariy,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            doctor.category,
            style: AppTextStyles.rubik14LightTiary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          buildRatingRow(),
        ],
      ),
    );
  }

  Widget buildRatingRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomRatingBar(rating: doctor.rating),
        Row(
          spacing: 4.w,
          children: [
            Text(
              doctor.rating.toString(),
              style: AppTextStyles.rubik16MediumPrimary,
            ),
            Text(
              '(${doctor.ratingCount})',
              style: AppTextStyles.rubik16Regulartertiary,
            ),
          ],
        ),
      ],
    );
  }
}
