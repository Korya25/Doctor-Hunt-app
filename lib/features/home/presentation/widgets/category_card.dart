import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.svgPath,
    required this.onTap,
    this.gradient,
    this.fallbackColor = Colors.transparent,
  });

  final String svgPath;
  final VoidCallback onTap;
  final Gradient? gradient;
  final Color fallbackColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        decoration: BoxDecoration(
          gradient: gradient,
          color: gradient == null ? fallbackColor : null,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            svgPath,
            colorFilter: gradient != null
                ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                : null,
          ),
        ),
      ),
    );
  }
}
