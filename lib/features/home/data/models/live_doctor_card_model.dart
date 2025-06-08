import 'package:flutter/material.dart';

class LiveDoctorCardModel {
  final String image;
  final VoidCallback onTap;

  LiveDoctorCardModel({required this.image, required this.onTap});

  static List<LiveDoctorCardModel> liveDoctorCardModels = [
    LiveDoctorCardModel(
      image:
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      onTap: () {},
    ),
    LiveDoctorCardModel(
      image:
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=8',
      onTap: () {},
    ),
    LiveDoctorCardModel(
      image:
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=8',
      onTap: () {},
    ),
    LiveDoctorCardModel(
      image:
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=8',
      onTap: () {},
    ),
  ];
}
