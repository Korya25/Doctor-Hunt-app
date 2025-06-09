import 'package:doctor_hunt/core/widgets/background_scaffold.dart';
import 'package:doctor_hunt/features/home/data/models/category_card_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindDoctorView extends StatelessWidget {
  const FindDoctorView({super.key, required this.categoryCardModel});
  final CategoryCardModel categoryCardModel;
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: Column(
        children: [
          SizedBox(height: 20.h),
          CustomAppBar(),

          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: categoryCardModel.doctors.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        categoryCardModel.doctors[index].image,
                      ),
                    ),
                    title: Text(categoryCardModel.doctors[index].name),
                    subtitle: Text(categoryCardModel.doctors[index].id),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
