// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedNetworkImageWithShimmer extends StatelessWidget {
  const CachedNetworkImageWithShimmer({
    super.key,
    required this.imageUrl,
    this.radius = 24.0,
    this.borderWidth = 2.0,
    this.borderColor = AppColors.secondaryColor,
    this.defaultIcon = Icons.person,
  });

  final String imageUrl;
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final IconData defaultIcon;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: radius * 2,
      height: radius * 2,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppColors.shimmerBase,
        highlightColor: AppColors.shimmerHighlight,
        child: Container(
          color: Colors.grey[300],
          width: radius * 2,
          height: radius * 2,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[200],
        width: radius * 2,
        height: radius * 2,
        child: Icon(defaultIcon, size: radius, color: Colors.grey[600]),
      ),
    );
  }
}
