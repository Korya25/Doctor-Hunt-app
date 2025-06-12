import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';

class TitleSub extends StatelessWidget {
  const TitleSub({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        Text(
          title,
          textAlign: TextAlign.center,

          style: AppTextStyles.rubik28MediumPrimary,
        ),

        // Subtitle
        Text(
          subtitle,
          maxLines: 3,
          textAlign: TextAlign.center,
          style: AppTextStyles.rubik14RegularTiary,
        ),
      ],
    );
  }
}

class AnimatedTitleSub extends StatelessWidget {
  const AnimatedTitleSub({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 80 * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
