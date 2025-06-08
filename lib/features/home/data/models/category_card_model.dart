import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:flutter/material.dart';

class CategoryCardModel {
  final String svgPath;
  final Gradient? gradient;
  final VoidCallback onTap;

  CategoryCardModel({
    required this.gradient,
    required this.svgPath,
    required this.onTap,
  });

  static List<CategoryCardModel> categories = [
    CategoryCardModel(
      svgPath: AppIconsSvgs.sprocket,
      onTap: () {},
      gradient: const LinearGradient(
        colors: [Color(0xff2753F3), Color(0xff765AFC)],
      ),
    ),
    CategoryCardModel(
      svgPath: AppIconsSvgs.heart,
      onTap: () {},
      gradient: const LinearGradient(
        colors: [Color(0xff0EBE7E), Color(0xff07D9AD)],
      ),
    ),
    CategoryCardModel(
      svgPath: AppIconsSvgs.eye,
      onTap: () {},
      gradient: const LinearGradient(
        colors: [Color(0xffFE7F44), Color(0xffFFCF68)],
      ),
    ),
    CategoryCardModel(
      svgPath: AppIconsSvgs.body,
      onTap: () {},
      gradient: const LinearGradient(
        colors: [Color(0xffFF484C), Color(0xffFF6C60)],
      ),
    ),
  ];
}
