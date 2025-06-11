import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_buttom.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/email_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late final TextEditingController _emailController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildIndicator(),
          Gap(30.h),
          Text(
            AppString.forgotPassword,
            style: AppTextStyles.rubik24MediumPrimary,
          ),
          Gap(12.h),
          Text(
            AppString.forgotPasswordTitle,
            style: AppTextStyles.rubik14RegularTiary,
          ),
          Gap(32.h),
          EmailField(emailController: _emailController),
          Gap(32.h),
          CustomButtom(
            height: 60.h,
            title: AppString.continueText,
            onTap: () => _handleContinue(context),
          ),
          Gap(16.h),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return Center(
      child: Container(
        width: 100,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(2.r),
        ),
      ),
    );
  }

  void _handleContinue(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      _showSuccessMessage(context, 'Email sent successfully!');
    }
  }

  void _showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
