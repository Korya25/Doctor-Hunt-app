import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: Column(
          children: [
            _buildDoctorInfoRow(),
            SizedBox(height: 12.h),
            _buildBottomActionRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorInfoRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Doctor Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: CachedNetworkImageWithShimmer(
            imageUrl: doctorModel.image,
            height: 87.h,
            width: 92.w,
          ),
        ),

        SizedBox(width: 12.w),

        // Doctor Details
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorModel.name,
                    style: AppTextStyles.rubik18MediumPrimariy,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    doctorModel.category,
                    style: AppTextStyles.rubik13RegularMainPrimairy,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${doctorModel.yearsExperience} ${AppString.yearsExperience}',
                    style: AppTextStyles.rubik12LightTertiary,
                  ),
                  SizedBox(height: 8.h),
                  _buildRatingAndPatientStories(),
                ],
              ),

              // Heart Icon
              FavoriteButton(height: 25.h, width: 25.w),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingAndPatientStories() {
    return Row(
      spacing: 20.w,
      children: [
        _buildInfoItem(icon: Icons.circle, value: '${doctorModel.rating}'),
        _buildInfoItem(
          icon: Icons.circle,
          value: '${doctorModel.patientStories} ${AppString.patientStories}',
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

  Widget _buildBottomActionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildNextAvailable(),
        CustomButtom(
          height: 45.h,
          width: 100.w,
          title: AppString.bookNow,
          textStyle: AppTextStyles.rubik12MediumSecondry,
          borderRadius: 4.r,
        ),
      ],
    );
  }

  Widget _buildNextAvailable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.nextAvailable,
          style: AppTextStyles.rubik13MediumMainPrimairy,
        ),
        SizedBox(height: 4.h),
        Text(
          doctorModel.nextAvailable,
          style: AppTextStyles.rubik12MediumTertiary,
        ),
      ],
    );
  }
}
