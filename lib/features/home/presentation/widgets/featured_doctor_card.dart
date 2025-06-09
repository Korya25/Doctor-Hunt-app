import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedDoctorCard extends StatelessWidget {
  const FeaturedDoctorCard({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Material(
          elevation: 10,
          child: SizedBox(
            width: 140,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                spacing: 10.h,
                children: [
                  // Heart & rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FavoriteButton(),
                      Row(
                        spacing: 3.w,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text(
                            doctorModel.rating.toString(),
                            style: AppTextStyles.rubik10MediumSecondry,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Image
                  ClipOval(
                    child: CachedNetworkImageWithShimmer(
                      imageUrl: doctorModel.image,
                    ),
                  ),

                  // Name
                  Text(
                    doctorModel.name,
                    style: AppTextStyles.rubik12MediumSecondry,
                  ),

                  // price of Hour
                  Text(
                    '${doctorModel.price}/ hours',
                    style: AppTextStyles.rubik9Lighttertiary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
