import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/widgets/Cached_network_image_with_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LiveDoctorCard extends StatelessWidget {
  const LiveDoctorCard({super.key, required this.image, required this.onTap});
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 110.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image
              CachedNetworkImageWithShimmer(imageUrl: image),

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
