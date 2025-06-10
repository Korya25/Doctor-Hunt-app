import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_rating_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectMeCard extends StatelessWidget {
  const SelectMeCard({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.secondaryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor Image
          SizedBox(
            width: 80.w,
            height: 80.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: CachedNetworkImageWithShimmer(imageUrl: doctor.image),
            ),
          ),
          SizedBox(width: 10.w),

          // Doctor Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor Name
                Text(
                  doctor.name,
                  style: AppTextStyles.rubik16MediumPrimary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),

                // Doctor Category
                Text(
                  doctor.category,
                  style: AppTextStyles.rubik12LightTertiary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),

                // Rating Bar
                CustomRatingBar(rating: doctor.rating),
              ],
            ),
          ),

          // Favorite Button
          FavoriteButton(height: 20.h, width: 20.w),
        ],
      ),
    );
  }
}
