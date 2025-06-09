import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/core/widgets/background_scaffold.dart';
import 'package:doctor_hunt/core/widgets/custom_header_section.dart';
import 'package:doctor_hunt/core/widgets/custom_horizontal_list_view.dart';
import 'package:doctor_hunt/features/home/data/doctor_data.dart';
import 'package:doctor_hunt/features/home/data/models/category_card_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/category_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_home_section.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/featured_doctor_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home_header.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/live_doctor_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/popular_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: SizedBox(
                height: 190.h,
                width: double.infinity,
                child: HomeHeader(
                  userName: 'Korya',
                  userImage:
                      'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                ),
              ),
            ),

            // Live Doctors
            SliverToBoxAdapter(
              child: CustomHomeSection(
                headerSection: CustomHeaderSection(
                  title: AppString.liveDoctors,
                ),
                horizontallistView: CustomHorizontalListView(
                  height: 170.h,
                  itemCount: DoctorData.liveDoctors.length,
                  itemBuilder: (context, index) {
                    final doctorModel = DoctorData.liveDoctors[index];
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          AppRoutes.doctorLiveChat,
                          extra: doctorModel,
                        );
                      },
                      child: LiveDoctorCard(doctorModel: doctorModel),
                    );
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 20.h)),

            // Categories
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPadding.paddingH20,
                child: CustomHorizontalListView(
                  height: 70.h,
                  itemCount: CategoryCardModel.categories.length,
                  itemBuilder: (context, index) {
                    final category = CategoryCardModel.categories[index];
                    return CategoryCard(cardModel: category);
                  },
                ),
              ),
            ),

            // Popular Doctors
            SliverToBoxAdapter(
              child: CustomHomeSection(
                headerSection: CustomHeaderSection(
                  title: AppString.popularDoctors,
                  activeSeeAll: true,
                  onSeeAllPressed: () => debugPrint("See all popular doctors"),
                ),
                horizontallistView: CustomHorizontalListView(
                  height: 280.h,
                  itemCount: DoctorData.popularDoctors.length,
                  itemBuilder: (context, index) {
                    final doctorModel = DoctorData.popularDoctors[index];
                    return PopularDoctorCard(doctorModel: doctorModel);
                  },
                ),
              ),
            ),

            // Featured Doctors
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CustomHomeSection(
                  headerSection: CustomHeaderSection(
                    title: AppString.featureDoctor,
                    activeSeeAll: true,
                    onSeeAllPressed: () =>
                        debugPrint("See all featured doctors"),
                  ),
                  horizontallistView: CustomHorizontalListView(
                    height: 200.h,
                    itemCount: DoctorData.featuredDoctors.length,
                    itemBuilder: (context, index) {
                      final doctorModel = DoctorData.featuredDoctors[index];
                      return FeaturedDoctorCard(doctorModel: doctorModel);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
