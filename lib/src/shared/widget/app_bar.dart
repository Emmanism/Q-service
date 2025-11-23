import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickservice/src/shared/widget/text.dart';

PreferredSizeWidget appBar({
  String? title,
  Color? bgColor,
  Widget actionWidget = const SizedBox(),
  Widget? leading,
  bool automaticallyImplyLeading = true,
}) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    leading: leading,
    automaticallyImplyLeading: automaticallyImplyLeading,
    foregroundColor: Colors.black,
    backgroundColor: bgColor ?? Colors.black,
    title: MedAppText(
      color: Colors.white,
      title ?? '',
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),
    centerTitle: true,
    actions: [actionWidget],
  );
}
