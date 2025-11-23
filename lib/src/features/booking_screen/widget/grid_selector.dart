import 'package:flutter/material.dart';
import 'package:quickservice/src/core/constant/color_constant.dart';
import 'package:quickservice/src/features/booking_screen/model/booking_model.dart';
import 'package:quickservice/src/shared/widget/text.dart';

class GridSelector extends StatelessWidget {
  final Times time;
   final VoidCallback? onTap;
   final bool isSelected;
  const GridSelector({
    super.key,
    required this.time,
    this.onTap,
    required this.isSelected,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: time.isBooked ? null : onTap,
      child: Opacity(
        opacity: time.isBooked ? 0.5 : 1.0,
        child: SmallAppText(
         time.time,
         fontWeight: FontWeight.bold,
         color: time.isBooked ? ColorConstant.greyColor : isSelected  ? ColorConstant.primaryColor : ColorConstant.lightestGrey,
        ),
      ),
    );
  }
}