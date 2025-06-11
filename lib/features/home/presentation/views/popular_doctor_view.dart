import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/widgets/background_scaffold.dart';
import 'package:doctor_hunt/core/widgets/custom_vertical_list_view.dart';
import 'package:doctor_hunt/core/widgets/search_input_field.dart';
import 'package:doctor_hunt/features/home/data/test_data/doctor_data.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/popular_doctor_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorView extends StatelessWidget {
  const PopularDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.paddingH20V20,
          child: Column(
            children: [
              const CustomAppBar(title: AppString.popularDoctors),
              SizedBox(height: 20.h),
              SearchInputField(hintText: AppString.searchHint),
              SizedBox(height: 20.h),
              const Expanded(child: PopularDoctorViewList()),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularDoctorViewList extends StatelessWidget {
  const PopularDoctorViewList({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = DoctorData.popularDoctors;

    return CustomVerticalListView(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return PopularDoctorViewCard(doctor: doctors[index]);
      },
    );
  }
}
