import 'package:flutter/material.dart';

class FormController {
  static final loginFormKey = GlobalKey<FormState>();
  static final signUpformKey = GlobalKey<FormState>();
  static final forgotPasswordFormKey = GlobalKey<FormState>();
  static final nameController = TextEditingController();
  static final loginEmailController = TextEditingController();
  static final signUpEmailController = TextEditingController();
  static final forgotPasswordEmailController = TextEditingController();
  static final loginPasswordController = TextEditingController();
  static final signUpPasswordController = TextEditingController();

  // reset Password controller
  static final resetPasswordNewPasswordController = TextEditingController();
  static final resetPasswordConfirmPasswordController = TextEditingController();

  // Disable controller
  static void disposeSignupForm() {
    nameController.dispose();
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
  }

  static void disposeLoginForm() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
  }

  static void disposeForgotPasswordForm() {
    forgotPasswordEmailController.dispose();
    resetPasswordNewPasswordController.dispose();
    resetPasswordConfirmPasswordController.dispose();
  }
}
