import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/widgets/Cached_network_image_with_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HeaderLiveChat extends StatelessWidget {
  const HeaderLiveChat({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              AppIconsSvgs.backButtom,
              height: 30.h,
              width: 30.w,
            ),
            onPressed: () => context.pop(),
          ),
          SizedBox(
            height: 36.h,
            width: 36.w,
            child: ClipOval(
              child: CachedNetworkImageWithShimmer(imageUrl: image),
            ),
          ),
        ],
      ),
    );
  }
}
