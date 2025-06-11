import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/widgets/background_scaffold.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_buttom.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/agree_terms.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/fotter_buttom.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/signup_form.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/social_buttons.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/view_message.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
                ViewMessage(
                  title: AppString.signUpTitle,
                  subtitle: AppString.signUpSubtitle,
                ),

                // Social Buttons
                // SocialButtons(),

                // Signup Form
                // SignupForm(),

                // Agree Terms
                // AgreeTerms(),

                // Signup Button
                // CustomButtom(title: AppString.signUp),

                // Fotter Buttons
                //FooterButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
