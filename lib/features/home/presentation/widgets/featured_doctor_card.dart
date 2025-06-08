import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/features/home/data/models/featured_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedDoctorCard extends StatelessWidget {
  const FeaturedDoctorCard({super.key, required this.featuredCardModel});
  final FeaturedCardModel featuredCardModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Material(
        elevation: 10,
        child: SizedBox(
          width: 140,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              spacing: 10.h,
              children: [
                // Heart & rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FavoriteButtom(isFavorite: featuredCardModel.isFavorite),
                    Row(
                      spacing: 3.w,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Text(
                          featuredCardModel.rating.toString(),
                          style: AppTextStyles.rubik10MediumSecondry,
                        ),
                      ],
                    ),
                  ],
                ),
                // Image
                ClipOval(
                  child: CachedNetworkImageWithShimmer(
                    imageUrl: featuredCardModel.doctorImage,
                  ),
                ),

                // Name
                Text(
                  featuredCardModel.doctorName,
                  style: AppTextStyles.rubik12MediumSecondry,
                ),

                // price of Hour
                Text(
                  '${featuredCardModel.priceOfHour}/ hours',
                  style: AppTextStyles.rubik9Lighttertiary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteButtom extends StatefulWidget {
  FavoriteButtom({super.key, required this.isFavorite});
  bool isFavorite;

  @override
  State<FavoriteButtom> createState() => _FavoriteButtomState();
}

class _FavoriteButtomState extends State<FavoriteButtom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isFavorite = !widget.isFavorite;
        });
      },
      child: widget.isFavorite
          ? Icon(Icons.favorite, color: Colors.red, size: 20)
          : Icon(Icons.favorite_border, color: Colors.grey, size: 20),
    );
  }
}
