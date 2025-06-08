import 'dart:ui';

class PopularDoctorCardModel {
  final String docName;
  final String docCategory;
  final String docImage;
  final double docRating;
  final VoidCallback onTap;
  PopularDoctorCardModel({
    required this.docName,
    required this.docCategory,
    required this.docImage,
    required this.docRating,
    required this.onTap,
  });

  static List<PopularDoctorCardModel> popularDoctors = [
    PopularDoctorCardModel(
      docName: 'Dr. Fillerup Grab',
      docCategory: 'Medicine Specialist',
      docImage:
          'https://images.pexels.com/photos/8376181/pexels-photo-8376181.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      docRating: 4,
      onTap: () {},
    ),
    PopularDoctorCardModel(
      docName: 'Dr. John Doe',
      docCategory: 'Cardiologist',
      docImage:
          'https://images.pexels.com/photos/8376181/pexels-photo-8376181.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      docRating: 4.5,
      onTap: () {},
    ),
    PopularDoctorCardModel(
      docName: 'Dr. John Doe',
      docCategory: 'Cardiologist',
      docImage:
          'https://images.pexels.com/photos/8376181/pexels-photo-8376181.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      docRating: 4.5,
      onTap: () {},
    ),
  ];
}
