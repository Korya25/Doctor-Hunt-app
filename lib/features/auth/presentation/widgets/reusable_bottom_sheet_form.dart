import 'package:doctor_hunt/core/presentation/widgets/custom_buttom.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ReusableBottomSheetForm extends StatefulWidget {
  const ReusableBottomSheetForm({
    super.key,
    required this.title,
    required this.subtitle,
    required this.fields,
    required this.buttonTitle,
    required this.onButtonPressed,
    this.formKey,
    this.showIndicator = true,
  });

  final String title;
  final String subtitle;
  final List<Widget> fields;
  final String buttonTitle;
  final VoidCallback onButtonPressed;
  final GlobalKey<FormState>? formKey;
  final bool showIndicator;

  @override
  State<ReusableBottomSheetForm> createState() =>
      _ReusableBottomSheetFormState();
}

class _ReusableBottomSheetFormState extends State<ReusableBottomSheetForm> {
  late final GlobalKey<FormState> _defaultFormKey;

  @override
  void initState() {
    super.initState();
    _defaultFormKey = GlobalKey<FormState>();
  }

  GlobalKey<FormState> get formKey => widget.formKey ?? _defaultFormKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.showIndicator) _buildIndicator(),
          if (widget.showIndicator) Gap(30.h),
          Text(
            widget.title,
            maxLines: 1,
            style: AppTextStyles.rubik24MediumPrimary,
          ),
          Gap(12.h),
          Text(
            widget.subtitle,
            maxLines: 3,
            style: AppTextStyles.rubik14RegularTiary,
          ),
          Gap(32.h),
          ...widget.fields.map(
            (field) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: field,
            ),
          ),
          Gap(16.h),
          CustomButtom(
            height: 60.h,
            title: widget.buttonTitle,
            onTap: widget.onButtonPressed,
          ),
          Gap(16.h),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
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
}
