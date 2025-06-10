import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/core/widgets/background_scaffold.dart';
import 'package:doctor_hunt/core/widgets/search_input_field.dart';
import 'package:doctor_hunt/features/home/data/models/category_card_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/find_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FindDoctorView extends StatelessWidget {
  const FindDoctorView({super.key, required this.categoryCardModel});
  final CategoryCardModel categoryCardModel;
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.paddingH20V20,
          child: Column(
            spacing: 10.h,
            children: [
              // App bar
              CustomAppBar(title: AppString.findDoctor),
              SizedBox(height: 16.h),

              // Search input field
              SearchInputField(hintText: AppString.searchHint),
              SizedBox(height: 16.h),
              // Find Doctor Cards
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: categoryCardModel.doctors.length,
                  itemBuilder: (context, index) {
                    return FindDoctorCard(
                      doctorModel: categoryCardModel.doctors[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 16.h);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
