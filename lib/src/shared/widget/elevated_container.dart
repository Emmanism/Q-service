import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickservice/src/core/constant/color_constant.dart';

Widget elevatedContainer({
  required Widget child,
  double? height,
  double? width,
  Color? bgColor,
  double? radius,
  Color? borderColor,
  Color? boxColor,
  double? borderWidth,
  bool hasBorder = true,
  BorderSide borderSide = BorderSide.none,

}) {
  return Container(
    constraints: height == null ? null : BoxConstraints(minHeight: height),
    width: width ?? double.maxFinite,
    decoration: BoxDecoration(
      color: bgColor ?? ColorConstant.lighterGrey,
      borderRadius: BorderRadius.circular(radius ?? 16.r),
      border: Border.all(
        color: borderColor ?? ColorConstant.lighterGrey,
        width: 1.w,
      ),
    ),
    child: child,
  );
}
