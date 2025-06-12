import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/features/onboarding/presentation/widgets/onboarding_animated_image.dart';
import 'package:doctor_hunt/features/onboarding/presentation/widgets/title_sub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingItems extends StatelessWidget {
  const OnboardingItems({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 18.h,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Image
        OnboardingAnimatedImage(image: image),
        // Title and Subtitle
        Padding(
          padding: AppPadding.paddingH25,
          child: TitleSub(title: title, subtitle: subtitle),
        ),
      ],
    );
  }
}
