import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_buttom.dart';
import 'package:doctor_hunt/core/utils/validators.dart';
import 'package:doctor_hunt/features/auth/presentation/controllers/form_controller.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/agree_terms.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/email_field.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  void dispose() {
    FormController.disposeSignupForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormController.signUpformKey,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // name
          AuthTextFormFieldWidget(
            hintText: AppString.name,
            controller: FormController.nameController,
            textCapitalization: TextCapitalization.words,
            validator: Validators.validateName,
          ),

          // email
          EmailField(emailController: FormController.signUpEmailController),

          // password
          PasswordField(controller: FormController.signUpPasswordController),

          // Agree Terms
          AgreeTerms(),

          // Signup Button
          CustomButtom(
            height: 60.h,
            title: AppString.signUp,
            onTap: () {
              if (FormController.signUpformKey.currentState!.validate()) {
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
