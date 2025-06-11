import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';

class AgreeTerms extends StatelessWidget {
  const AgreeTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Checkbox
        CheckBoxButton(),

        // Text
        Text(AppString.signUpTerms, style: AppTextStyles.rubik12LightTertiary),
      ],
    );
  }
}

class CheckBoxButton extends StatefulWidget {
  const CheckBoxButton({super.key});

  @override
  State<CheckBoxButton> createState() => _CheckBoxButtonState();
}

class _CheckBoxButtonState extends State<CheckBoxButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Checkbox(value: isChecked, shape: CircleBorder(), onChanged: null),
    );
  }
}
