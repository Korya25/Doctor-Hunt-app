import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/core/widgets/background_scaffold.dart';
import 'package:doctor_hunt/core/widgets/custom_header_section.dart';
import 'package:doctor_hunt/core/widgets/custom_horizontal_list_view.dart';
import 'package:doctor_hunt/features/home/data/test_data/doctor_data.dart';
import 'package:doctor_hunt/features/home/data/models/category_card_model.dart';
import 'package:doctor_hunt/features/home/data/test_data/fake_users.dart';
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
                  userName: fakeUsers[0].name,
                  userImage: fakeUsers[0].imageUrl,
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
                          extra: {'doctor': doctorModel, 'user': fakeUsers[0]},
                        );
                      },
                      child: LiveDoctorCard(doctorModel: doctorModel),
                    );
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 28.h)),

            // Categories
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPadding.paddingH20,
                child: CustomHorizontalListView(
                  height: 85.h,
                  itemCount: CategoryCardModel.categories.length,
                  itemBuilder: (context, index) {
                    final category = CategoryCardModel.categories[index];
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          AppRoutes.findDoctor,
                          extra: category,
                        );
                      },
                      child: CategoryCard(cardModel: category),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 18.h)),

            // Popular Doctors
            SliverToBoxAdapter(
              child: CustomHomeSection(
                headerSection: CustomHeaderSection(
                  title: AppString.popularDoctors,
                  activeSeeAll: true,
                  onSeeAllPressed: () {
                    context.pushNamed(AppRoutes.popularDoctors);
                  },
                ),
                horizontallistView: CustomHorizontalListView(
                  height: 270.h,
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
                    onSeeAllPressed: () {
                      context.pushNamed(AppRoutes.featuredDoctors);
                    },
                  ),
                  horizontallistView: CustomHorizontalListView(
                    height: 170.h,
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
