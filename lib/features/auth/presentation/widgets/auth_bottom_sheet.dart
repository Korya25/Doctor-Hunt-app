import 'package:doctor_hunt/features/auth/presentation/widgets/forgot_password_dialog.dart';
import 'package:flutter/material.dart';

class AuthBottomSheet {
  static Future<void> showForgotPassword(BuildContext context) {
    return showModalBottomSheet<void>(
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
}
