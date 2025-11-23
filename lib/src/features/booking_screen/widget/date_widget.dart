import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickservice/src/core/constant/color_constant.dart';
import 'package:quickservice/src/shared/widget/text.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key, 
    required this.date, 
    required this.onTap,
    required this.isSelected, 
    });

  final String date;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorConstant.lightestGrey),
          borderRadius: BorderRadius.circular(16.r),
          color: isSelected ? ColorConstant.primaryColor : ColorConstant.lightestGrey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SmallAppText(
            date ,
            fontSize: 10.sp,
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w400,
          )
          
         
        ),
      ),
    );
  }
}
