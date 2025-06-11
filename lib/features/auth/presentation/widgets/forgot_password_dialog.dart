import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_buttom.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/auth/presentation/controllers/form_controller.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/email_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForgotPasswordBottomSheet extends StatefulWidget {
  const ForgotPasswordBottomSheet({super.key});

  @override
  State<ForgotPasswordBottomSheet> createState() =>
      _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<ForgotPasswordBottomSheet> {
  @override
  void dispose() {
    FormController.disposeForgotPasswordForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 30,
      ),
      child: Form(
        key: FormController.forgotPasswordFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top drag indicator
            Center(
              child: Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Gap(30.h),

            // Title
            Text(
              AppString.forgotPassword,
              style: AppTextStyles.rubik24MediumPrimary,
            ),
            Gap(12.h),

            // Subtitle
            Text(
              AppString.forgotPasswordTitle,
              style: AppTextStyles.rubik14RegularTiary,
            ),
            Gap(32.h),

            // Email input
            EmailField(
              emailController: FormController.forgotPasswordEmailController,
            ),

            Gap(32.h),

            // Continue button
            CustomButtom(
              height: 60.h,
              title: AppString.continueText,
              onTap: () {
                if (FormController.forgotPasswordFormKey.currentState!
                    .validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form is valid!')),
                  );
                }
              },
            ),
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}

// Helper function to show the bottom sheet
Future<String?> showForgotPasswordBottomSheet(BuildContext context) {
  return showModalBottomSheet<String>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    builder: (BuildContext context) {
      return const ForgotPasswordBottomSheet();
    },
  );
}

// Alternative function with animation and custom properties
Future<String?> showForgotPasswordBottomSheetCustom(BuildContext context) {
  return showModalBottomSheet<String>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return const ForgotPasswordBottomSheet();
    },
  );
}
