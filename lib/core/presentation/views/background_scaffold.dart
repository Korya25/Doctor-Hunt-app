import 'dart:ui';
import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundScaffold extends StatelessWidget {
  const BackgroundScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
  });

  final Widget body;
  final AppBar? appBar;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar ?? const SizedBox(),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(-1.2, -1.2),
            child: _buildBlurredCircle(
              color: AppColors.topBackgroundContainer,
              size: 216.w,
              blurSigma: 269,
              opacity: 0.3,
            ),
          ),

          Align(
            alignment: const Alignment(1.2, 1.2),
            child: _buildBlurredCircle(
              color: AppColors.bottomBackgroundContainer,
              size: 216.w,
              blurSigma: 269,
              opacity: 0.3,
            ),
          ),
          body,
        ],
      ),
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
