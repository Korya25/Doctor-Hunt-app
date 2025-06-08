import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/widgets/Cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/features/home/data/models/live_doctor_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LiveDoctorCard extends StatelessWidget {
  const LiveDoctorCard({super.key, required this.liveDoctorCardModel});
  final LiveDoctorCardModel liveDoctorCardModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: liveDoctorCardModel.onTap,
      child: SizedBox(
        width: 110.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImageWithShimmer(
                imageUrl: liveDoctorCardModel.image,
              ),
              // Play Icon
              SvgPicture.asset(AppIconsSvgs.playVedio, fit: BoxFit.scaleDown),

              // Live Icon
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  AppIconsSvgs.live,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
