import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_buttom.dart';
import 'package:doctor_hunt/features/auth/presentation/controllers/form_controller.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/email_field.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  void dispose() {
    FormController.disposeLoginForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormController.loginFormKey,
      child: Column(
        spacing: 20.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // email
          EmailField(emailController: FormController.loginEmailController),

          // password
          PasswordField(controller: FormController.loginPasswordController),

          // Login
          CustomButtom(
            height: 60.h,
            title: AppString.login,
            onTap: () {
              if (FormController.loginFormKey.currentState!.validate()) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Form is valid!')));
              }
            },
          ),
        ],
      ),
    );
  }
}
