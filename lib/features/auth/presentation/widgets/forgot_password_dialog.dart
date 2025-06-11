import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordBottomSheet extends StatelessWidget {
  const ForgotPasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildContainerDecoration(),
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 30,
      ),
      child: ForgotPasswordForm(),
    );
  }

  BoxDecoration buildContainerDecoration() {
    return BoxDecoration(
      color: AppColors.secondaryColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
    );
  }
}
