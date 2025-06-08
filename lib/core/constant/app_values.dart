import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  // Paddin
  static EdgeInsetsGeometry paddingH20V20 = EdgeInsets.symmetric(
    horizontal: 20.w,
    vertical: 20.h,
  );
  static EdgeInsetsGeometry paddingH20 = EdgeInsets.symmetric(horizontal: 20.w);
  static EdgeInsetsGeometry paddingH25 = EdgeInsetsGeometry.symmetric(
    horizontal: 25.w,
  );
}

class AppSize {
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
