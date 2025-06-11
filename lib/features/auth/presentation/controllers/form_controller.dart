import 'package:flutter/material.dart';

class FormController {
  // Singleton pattern to ensure single instance
  static final FormController _instance = FormController._internal();
  factory FormController() => _instance;
  FormController._internal();

  // Form Keys
  static final GlobalKey<FormState> signUpformKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> forgotPasswordFormKey =
      GlobalKey<FormState>();

  // Controllers - Initialize once
  static TextEditingController? _nameController;
  static TextEditingController? _signUpEmailController;
  static TextEditingController? _signUpPasswordController;
  static TextEditingController? _loginEmailController;
  static TextEditingController? _loginPasswordController;
  static TextEditingController? _forgotPasswordEmailController;

  // Getters with lazy initialization
  static TextEditingController get nameController {
    _nameController ??= TextEditingController();
    return _nameController!;
  }

  static TextEditingController get signUpEmailController {
    _signUpEmailController ??= TextEditingController();
    return _signUpEmailController!;
  }

  static TextEditingController get signUpPasswordController {
    _signUpPasswordController ??= TextEditingController();
    return _signUpPasswordController!;
  }

  static TextEditingController get loginEmailController {
    _loginEmailController ??= TextEditingController();
    return _loginEmailController!;
  }

  static TextEditingController get loginPasswordController {
    _loginPasswordController ??= TextEditingController();
    return _loginPasswordController!;
  }

  static TextEditingController get forgotPasswordEmailController {
    _forgotPasswordEmailController ??= TextEditingController();
    return _forgotPasswordEmailController!;
  }

  // Safe disposal methods
  static void disposeSignupForm() {
    _nameController?.dispose();
    _signUpEmailController?.dispose();
    _signUpPasswordController?.dispose();
    _nameController = null;
    _signUpEmailController = null;
    _signUpPasswordController = null;
  }

  static void disposeLoginForm() {
    _loginEmailController?.dispose();
    _loginPasswordController?.dispose();
    _loginEmailController = null;
    _loginPasswordController = null;
  }

  static void disposeForgotPasswordForm() {
    _forgotPasswordEmailController?.dispose();
    _forgotPasswordEmailController = null;
  }

  // Dispose all controllers
  static void disposeAll() {
    disposeSignupForm();
    disposeLoginForm();
    disposeForgotPasswordForm();
  }

  // Clear all form fields
  static void clearSignupForm() {
    nameController.clear();
    signUpEmailController.clear();
    signUpPasswordController.clear();
  }

  static void clearLoginForm() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  static void clearForgotPasswordForm() {
    forgotPasswordEmailController.clear();
  }
}
