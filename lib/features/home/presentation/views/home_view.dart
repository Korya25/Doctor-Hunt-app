import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/widgets/background_scaffold.dart';
import 'package:doctor_hunt/core/widgets/custom_header_section.dart';
import 'package:doctor_hunt/core/widgets/custom_horizontal_list_view.dart';
import 'package:doctor_hunt/features/home/data/models/category_card_model.dart';
import 'package:doctor_hunt/features/home/data/models/featured_card_model.dart';
import 'package:doctor_hunt/features/home/data/models/popular_doctor_card_model.dart';
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
                  userImage:
                      'https://scontent.fcai21-4.fna.fbcdn.net/v/t51.75761-15/487994668_17928347880030134_5176698349206987161_n.jpg?stp=dst-jpg_tt6&_nc_cat=101&ccb=1-7&_nc_sid=127cfc&_nc_ohc=NEo6df7yBncQ7kNvwHFoC0c&_nc_oc=AdkUz4fDN38uZLbxX2CNrcrT85BMqeJZ0HjpeRWjuwG9HAxBxRdhzi7Z_NO_6IdM9x0&_nc_zt=23&_nc_ht=scontent.fcai21-4.fna&_nc_gid=4oUwCthFpaBZythMnUCrwQ&oh=00_AfMwls07yykIGcZMNWYDjAOzQKkjQq-512kHgd8ls3WqUA&oe=684A0E2C',
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return LiveDoctorCard(
                      image:
                          'https://images.pexels.com/photos/8376181/pexels-photo-8376181.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      onTap: () {},
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
                    final categories = CategoryCardModel.categories[index];
                    return CategoryCard(
                      svgPath: categories.svgPath,
                      onTap: categories.onTap,
                      gradient: categories.gradient,
                    );
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
                  onSeeAllPressed: () {},
                ),

                horizontallistView: CustomHorizontalListView(
                  height: 280.h,

                  itemCount: PopularDoctorCardModel.popularDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = PopularDoctorCardModel.popularDoctors[index];
                    return PopularDoctorCard(
                      onTap: doctor.onTap,
                      docName: doctor.docName,
                      docCategory: doctor.docCategory,
                      docImage: doctor.docImage,
                      docRating: doctor.docRating,
                    );
                  },
                ),
              ),
            ),

            // Featured Doctors
            SliverToBoxAdapter(
              child: CustomHomeSection(
                headerSection: CustomHeaderSection(
                  title: AppString.featureDoctor,
                  activeSeeAll: true,
                  onSeeAllPressed: () {},
                ),

                horizontallistView: CustomHorizontalListView(
                  height: 180.h,

                  itemCount: FeaturedCardModel.featuredDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = FeaturedCardModel.featuredDoctors[index];
                    return FeaturedDoctorCard(featuredCardModel: doctor);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
