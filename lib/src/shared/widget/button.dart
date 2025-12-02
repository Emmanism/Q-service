import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickservice/src/core/constant/color_constant.dart';
import 'package:quickservice/src/shared/widget/text.dart';

class BButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? radius;
  final void Function()? onTap;
  final Color? color;
  final Widget? item;
  final String? text;
  final bool isText;
  final Color? textColor;
  final Color? borderColor;
  final Widget? child;
  final bool isEnabled;
  final bool isLoading;
  
  const BButton({
    super.key,
    this.height,
    this.width,
    this.fontSize,
    this.radius,
    required this.onTap,
    this.color,
    this.item,
    this.text,
    this.isText = true,
    this.textColor,
    this.borderColor,
    this.fontWeight,
    this.child,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 52.h,
      width: width ?? 329.w,
      child: ElevatedButton(
        onPressed: isEnabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: borderColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 12.r),
            ),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: isEnabled 
              ? (color ?? ColorConstant.primaryColor)
              : ColorConstant.greyColor,
          disabledBackgroundColor: ColorConstant.greyColor,
        ),
        child: child ?? 
        
      Center(
        child: Visibility(
          visible: isLoading == false,
          replacement:  SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(textColor ?? Colors.white),
                ),
              ),
          child: SmallAppText(
            text ?? '',
             color: isEnabled 
                 ? (textColor ?? Colors.white)
                 : Colors.white70,
              fontSize: fontSize ?? 17.sp,
              fontWeight: FontWeight.bold
          ),
        ),
      )
    ));
  }
}