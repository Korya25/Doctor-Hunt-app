import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/utils/enums.dart';
import 'package:doctor_hunt/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle _rubik({
    required double fontSize,
    required FontWeightType weight,
    double letterSpacing = 0,
    required Color color,
  }) {
    return GoogleFonts.rubik(
      fontSize: fontSize.sp,
      fontWeight: weight.fontWeight,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  // Onboarding Screen
  static TextStyle get rubik28MediumPrimary => _rubik(
    fontSize: 28.sp,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik14RegularTiary => _rubik(
    fontSize: 14.sp,
    weight: FontWeightType.regular,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );
  static TextStyle get rubik14LightTiary => _rubik(
    fontSize: 14.sp,
    weight: FontWeightType.light,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  // Buttons
  static TextStyle get rubik18MediumSecondary => _rubik(
    fontSize: 18.sp,
    weight: FontWeightType.medium,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle get rubik14MediumTertiary => _rubik(
    fontSize: 14.sp,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle get rubikLight20Secondary => _rubik(
    fontSize: 20.sp,
    weight: FontWeightType.light,
    letterSpacing: -0.3,
    color: AppColors.secondaryTextColor,
  );
  static TextStyle get rubikBold25Secondary => _rubik(
    fontSize: 25.sp,
    weight: FontWeightType.bold,
    letterSpacing: -0.3,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle get rubik15MediumPrimary => _rubik(
    fontSize: 15.sp,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );
  static TextStyle get rubik12LightTertiary => _rubik(
    fontSize: 12.sp,
    weight: FontWeightType.light,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle get rubik10MediumSecondry => _rubik(
    fontSize: 10.sp,
    weight: FontWeightType.bold,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik12MediumSecondry => _rubik(
    fontSize: 12.sp,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik9Lighttertiary => _rubik(
    fontSize: 9.sp,
    weight: FontWeightType.light,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle get rubik14LightSecondary => _rubik(
    fontSize: 14.sp,
    weight: FontWeightType.light,
    letterSpacing: -0.3,
    color: AppColors.secondaryTextColor,
  );
}
