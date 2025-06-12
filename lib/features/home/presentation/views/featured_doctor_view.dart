import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/views/background_scaffold.dart';
import 'package:doctor_hunt/core/presentation/widgets/search_input_field.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/data/test_data/doctor_data.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/featured_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedDoctorView extends StatelessWidget {
  const FeaturedDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.paddingH20V20,
          child: Column(
            children: [
              const CustomAppBar(title: AppString.featureDoctor),
              SizedBox(height: 20.h),
              SearchInputField(hintText: AppString.searchHint),
              SizedBox(height: 20.h),
              const Expanded(child: FeaturedDoctorViewBody()),
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturedDoctorViewBody extends StatelessWidget {
  const FeaturedDoctorViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    List<DoctorModel> doctors = DoctorData.featuredDoctors;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: doctors.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FeaturedDoctorCard(doctorModel: doctors[index]),
        );
      },
    );
  }
}
