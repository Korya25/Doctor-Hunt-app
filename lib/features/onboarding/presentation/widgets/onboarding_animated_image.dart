import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingAnimatedImage extends StatefulWidget {
  const OnboardingAnimatedImage({super.key, required this.image});
  final String image;
  @override
  State<OnboardingAnimatedImage> createState() =>
      _OnboardingAnimatedImageState();
}

class _OnboardingAnimatedImageState extends State<OnboardingAnimatedImage> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: CircleAvatar(
        radius: 180.r,
        backgroundImage: AssetImage(widget.image),
      ),
    );
  }
}
