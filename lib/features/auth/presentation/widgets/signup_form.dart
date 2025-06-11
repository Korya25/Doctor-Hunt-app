import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/utils/validators.dart';
import 'package:doctor_hunt/features/auth/presentation/controllers/form_controller.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormController.signUpformKey,
      child: Column(
        spacing: 20.h,
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
          AuthTextFormFieldWidget(
            hintText: AppString.email,
            controller: FormController.signUpEmailController,
            keyboardType: TextInputType.emailAddress,
            validator: Validators.validateEmail,
          ),

          // password
          AuthTextFormFieldWidget(
            hintText: AppString.password,
            controller: FormController.signUpPasswordController,
            obscureText: true,
            validator: Validators.validatePassword,
          ),

          // Agree Terms
          // AgreeTerms(),

          // Signup Button
          /*   ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Form is valid!')));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),*/
        ],
      ),
    );
  }
}
