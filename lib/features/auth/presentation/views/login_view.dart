import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/widgets/background_scaffold.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/forgot_password_dialog.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/fotter_buttom.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/login_form.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/social_buttons.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/view_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.paddingH20V20,
            child: Column(
              children: [
                // ViewMessage
                Gap(20.h),

                ViewMessage(
                  title: AppString.loginTitle,
                  subtitle: AppString.loginSubtitle,
                ),
                Gap(50.h),
                // Social Buttons
                SocialButtons(),
                Gap(30.h),

                // Signup Form
                LoginForm(),
                Gap(20.h),
                // Forgot Password
                FooterButtons(
                  onTap: () {
                    showForgotPasswordBottomSheet(context);
                  },
                  title: AppString.forgotPassword,
                ),

                // Fotter Buttons
                Gap(100.h),
                FooterButtons(
                  onTap: () {
                    context.pop();
                  },
                  title: AppString.dontHaveAccount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
