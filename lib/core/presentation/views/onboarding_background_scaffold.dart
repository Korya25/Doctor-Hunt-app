import 'dart:ui';
import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingBackgroundScaffold extends StatelessWidget {
  const OnboardingBackgroundScaffold({
    super.key,
    required this.child,
    required this.isTopContainerLeft,
  });

  final Widget child;
  final bool isTopContainerLeft;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Bottom
        Align(
          alignment: const Alignment(1.2, 1.2),
          child: _buildBlurredCircle(
            color: AppColors.bottomBackgroundContainer,
            size: 216.w,
            blurSigma: 269,
            opacity: 0.3,
          ),
        ),

        /// Top
        AnimatedAlign(
          alignment: Alignment(isTopContainerLeft ? -17.0 : 17.0, -1.5),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          child: Container(
            height: 362.h,
            width: 362.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
          ),
        ),

        child,
      ],
    );
  }

  Widget _buildBlurredCircle({
    required Color color,
    required double size,
    double blurSigma = 50,
    double opacity = 0.2,
  }) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(opacity),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(color: Colors.transparent),
      ),
    );
  }
}
