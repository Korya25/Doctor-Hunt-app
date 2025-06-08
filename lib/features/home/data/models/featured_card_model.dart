import 'dart:ui';

import 'package:doctor_hunt/features/home/data/models/base_card_model.dart';

class FeaturedCardModel extends BaseCardModel {
  final bool isFavorite;
  final double rating;
  final String doctorName;
  final String doctorImage;
  final String priceOfHour;

  FeaturedCardModel({
    required this.isFavorite,
    required this.rating,
    required this.doctorName,
    required this.doctorImage,
    required this.priceOfHour,
    required VoidCallback onTap,
  }) : super(onTap: onTap);

  static List<FeaturedCardModel> featuredDoctors = [
    FeaturedCardModel(
      isFavorite: true,
      rating: 4.8,
      doctorName: 'Dr. Amelia Rose',
      doctorImage:
          'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=1470&q=80',
      priceOfHour: '\$35.00',
      onTap: () {},
    ),
    FeaturedCardModel(
      isFavorite: false,
      rating: 4.5,
      doctorName: 'Dr. Michael Hart',
      doctorImage:
          'https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=crop&w=1470&q=80',
      priceOfHour: '\$40.00',
      onTap: () {},
    ),
    FeaturedCardModel(
      isFavorite: true,
      rating: 4.2,
      doctorName: 'Dr. Lila Nguyen',
      doctorImage:
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=1470&q=80',
      priceOfHour: '\$32.00',
      onTap: () {},
    ),
    FeaturedCardModel(
      isFavorite: false,
      rating: 3.9,
      doctorName: 'Dr. Omar Khaled',
      doctorImage:
          'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?auto=format&fit=crop&w=1470&q=80',
      priceOfHour: '\$28.00',
      onTap: () {},
    ),
    FeaturedCardModel(
      isFavorite: true,
      rating: 4.6,
      doctorName: 'Dr. Sofia Martins',
      doctorImage:
          'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?auto=format&fit=crop&w=1470&q=80',
      priceOfHour: '\$38.00',
      onTap: () {},
    ),
    FeaturedCardModel(
      isFavorite: false,
      rating: 3.7,
      doctorName: 'Dr. Jason Lee',
      doctorImage:
          'https://images.unsplash.com/photo-1511367461989-f85a21fda167?auto=format&fit=crop&w=1470&q=80',
      priceOfHour: '\$30.00',
      onTap: () {},
    ),
  ];
}
