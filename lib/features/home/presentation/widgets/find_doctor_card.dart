import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FindDoctorCard extends StatelessWidget {
  const FindDoctorCard({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.h,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),

        // Card content
        child: FindDoctorCardContent(doctorModel: doctorModel),
      ),
    );
  }
}

class FindDoctorCardContent extends StatelessWidget {
  const FindDoctorCardContent({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //  doctor image & details
        Column(
          spacing: 8.h,
          children: [
            Row(
              spacing: 12.w,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImageWithShimmer(
                    imageUrl: doctorModel.image,
                    height: 87.h,
                    width: 92.w,
                  ),
                ),

                // Doctor details
                DoctorDetail(doctorModel: doctorModel),
              ],
            ),

            // next available time & book button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Next available time
                Column(
                  spacing: 4.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.nextAvailable,
                      style: AppTextStyles.rubik13MediumMainPrimairy,
                    ),

                    // Next available value
                    Text(
                      doctorModel.nextAvailable,
                      style: AppTextStyles.rubik12MediumTertiary,
                    ),
                  ],
                ),
                // Book now button
                CustomButtom(
                  height: 45.h,
                  width: 100.w,
                  title: AppString.bookNow,
                  textStyle: AppTextStyles.rubik12MediumSecondry,
                  borderRadius: 4.r,
                  onTap: () {
                    context.pushNamed(AppRoutes.selectMe, extra: doctorModel);
                  },
                ),
              ],
            ),
          ],
        ),
        // Favorite button
        Align(
          alignment: Alignment.topRight,
          child: FavoriteButton(height: 22.h, width: 22.w),
        ),
      ],
    );
  }
}

class DoctorDetail extends StatelessWidget {
  const DoctorDetail({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  name
        Text(
          doctorModel.name,
          style: AppTextStyles.rubik18MediumPrimariy,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        //  category
        Text(
          doctorModel.category,
          style: AppTextStyles.rubik13RegularMainPrimairy,
        ),
        //  experience
        Text(
          '${doctorModel.yearsExperience} ${AppString.yearsExperience}',
          style: AppTextStyles.rubik12LightTertiary,
        ),
        //  rating & patient stories
        Row(
          spacing: 20.w,

          children: [
            _buildInfoItem(icon: Icons.circle, value: '${doctorModel.rating}'),

            _buildInfoItem(
              icon: Icons.circle,
              value:
                  '${doctorModel.patientStories} ${AppString.patientStories}',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem({required IconData icon, required String value}) {
    return Row(
      children: [
        Icon(icon, size: 18.h, color: AppColors.primaryColor),
        SizedBox(width: 4.w),
        Text(value, style: AppTextStyles.rubik12LightTertiary),
      ],
    );
  }
}
