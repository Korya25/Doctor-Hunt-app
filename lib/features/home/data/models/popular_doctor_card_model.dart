import 'dart:ui';

import 'package:doctor_hunt/features/home/data/models/base_card_model.dart';

class PopularDoctorCardModel extends BaseCardModel {
  final String docName;
  final String docCategory;
  final String docImage;
  final double docRating;
  PopularDoctorCardModel({
    required this.docName,
    required this.docCategory,
    required this.docImage,
    required this.docRating,
    required VoidCallback onTap,
  }) : super(onTap: onTap);
  static List<PopularDoctorCardModel> popularDoctors = [
    PopularDoctorCardModel(
      docName: 'Dr. Fillerup Grab',
      docCategory: 'Medicine Specialist',
      docImage:
          'https://images.pexels.com/photos/8376181/pexels-photo-8376181.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      docRating: 4.0,
      onTap: () {},
    ),
    PopularDoctorCardModel(
      docName: 'Dr. John Doe',
      docCategory: 'Cardiologist',
      docImage:
          'https://images.pexels.com/photos/4099122/pexels-photo-4099122.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      docRating: 4.5,
      onTap: () {},
    ),
    PopularDoctorCardModel(
      docName: 'Dr. Sarah Connor',
      docCategory: 'Neurologist',
      docImage:
          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      docRating: 4.7,
      onTap: () {},
    ),
    PopularDoctorCardModel(
      docName: 'Dr. James Smith',
      docCategory: 'Dermatologist',
      docImage:
          'https://images.pexels.com/photos/3785075/pexels-photo-3785075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      docRating: 4.2,
      onTap: () {},
    ),
    PopularDoctorCardModel(
      docName: 'Dr. Lisa Brown',
      docCategory: 'Pediatrician',
      docImage:
          'https://images.pexels.com/photos/428339/pexels-photo-428339.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      docRating: 4.9,
      onTap: () {},
    ),
  ];
}
