import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SendMessageField extends StatelessWidget {
  const SendMessageField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: SizedBox(
        height: 54.h,
        child: TextField(
          controller: controller,
          onSubmitted: (_) => onSend(),
          decoration: InputDecoration(
            hintText: AppString.sendCommentHint,
            hintStyle: AppTextStyles.rubik14LightTiary,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.r),
              child: SvgPicture.asset(
                AppIconsSvgs.messageChatLive,
                fit: BoxFit.scaleDown,
              ),
            ),
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                AppIconsSvgs.imojeeChatLive,
                fit: BoxFit.scaleDown,
              ),
              onPressed: onSend,
            ),
            fillColor: AppColors.secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(27.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
