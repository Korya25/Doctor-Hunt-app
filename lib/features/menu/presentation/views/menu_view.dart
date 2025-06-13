import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_vertical_list_view.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/home/data/test_data/fake_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6F7FA1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _MenuHeader(),
              SizedBox(height: 24.h),
              const Expanded(child: MenuList()),
              const LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuHeader extends StatelessWidget {
  const _MenuHeader();

  @override
  Widget build(BuildContext context) {
    return CustomFadeIn(
      direction: FadeDirection.left,
      child: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: fakeUsers[0].imageUrl,
              width: 50.w,
              height: 50.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fakeUsers[0].name,
                  style: AppTextStyles.rubik16Mediumsecondary,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: AppColors.secondaryColor,
                      size: 14,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      fakeUsers[0].phone,
                      style: AppTextStyles.rubik12Regularsecondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: const Icon(Icons.close, color: Colors.red, size: 28),
          ),
        ],
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuItemModel> menuItems = [
      MenuItemModel(AppString.mDoctors, AppIconsSvgs.person),
      MenuItemModel(AppString.medicalRecords, AppIconsSvgs.medicalRecords),
      MenuItemModel(AppString.payments, AppIconsSvgs.payments),
      MenuItemModel(AppString.medicineOrders, AppIconsSvgs.medicineOrders),
      MenuItemModel(AppString.testBookings, AppIconsSvgs.testBookings),
      MenuItemModel(AppString.privacyPolicy, AppIconsSvgs.privacyPolicy),
      MenuItemModel(AppString.helpCenter, AppIconsSvgs.helpCenter),
      MenuItemModel(AppString.settings, AppIconsSvgs.settings),
    ];

    return CustomVerticalListView(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return MenuCard(title: item.title, icon: item.icon);
      },
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(title, style: AppTextStyles.rubik16RegularSecondary),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          SvgPicture.asset(AppIconsSvgs.logOut),
          SizedBox(width: 8.w),
          Text(
            AppString.logout,
            style: AppTextStyles.rubik16RegularSecondary.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemModel {
  final String title;
  final String icon;

  MenuItemModel(this.title, this.icon);
}
