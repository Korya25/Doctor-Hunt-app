import 'package:doctor_hunt/features/home/data/models/category_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.cardModel});
  final CategoryCardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardModel.onTap,
      child: Container(
        width: 80.w,
        decoration: BoxDecoration(
          gradient: cardModel.gradient,
          color: cardModel.gradient == null ? Color(0xfffffff) : null,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            cardModel.svgPath,
            colorFilter: cardModel.gradient != null
                ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                : null,
          ),
        ),
      ),
    );
  }
}
