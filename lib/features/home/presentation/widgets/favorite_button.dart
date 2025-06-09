import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: SvgPicture.asset(
        isFavorite ? AppIconsSvgs.favorite : AppIconsSvgs.nonFavorite,
        height: 14,
        width: 14,
      ),
    );
  }
}
