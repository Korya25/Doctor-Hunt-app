import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/widgets/background_scaffold.dart';
import 'package:doctor_hunt/core/widgets/custom_header_section.dart';
import 'package:doctor_hunt/core/widgets/custom_horizontal_list_view.dart';
import 'package:doctor_hunt/features/home/data/models/category_card_model.dart';
import 'package:doctor_hunt/features/home/data/models/featured_card_model.dart';
import 'package:doctor_hunt/features/home/data/models/popular_doctor_card_model.dart';
import 'package:doctor_hunt/features/home/data/models/live_doctor_card_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/category_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_home_section.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/featured_doctor_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home_header.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/live_doctor_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/popular_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  userImage: 'https://example.com/user.jpg',
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
                  itemCount: LiveDoctorCardModel.liveDoctorCardModels.length,
                  itemBuilder: (context, index) {
                    final liveDoctorCardModel =
                        LiveDoctorCardModel.liveDoctorCardModels[index];
                    return LiveDoctorCard(
                      liveDoctorCardModel: liveDoctorCardModel,
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
                  itemCount: PopularDoctorCardModel.popularDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = PopularDoctorCardModel.popularDoctors[index];
                    return PopularDoctorCard(popularDoctorCardModel: doctor);
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
                    itemCount: FeaturedCardModel.featuredDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = FeaturedCardModel.featuredDoctors[index];
                      return FeaturedDoctorCard(featuredCardModel: doctor);
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
