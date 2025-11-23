import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickservice/src/core/constant/color_constant.dart';
import 'package:quickservice/src/shared/widget/space.dart';
import 'package:quickservice/src/shared/widget/text.dart';

class BookingConfirmationDialog extends StatelessWidget {
  final String providerName;
  final String date;
  final String time;
  final String duration;
  final double total;

  const BookingConfirmationDialog({
    super.key,
    required this.providerName,
    required this.date,
    required this.time,
    required this.duration,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: BorderSide(color: ColorConstant.primaryColor, width: 2),
      ),
      child: Padding(
        padding: simPad(20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MedAppText(
                  'Booking Confirmed!',
                  color: ColorConstant.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            vSpace(20),
            _buildInfoRow('Provider', providerName),
            vSpace(10),
            _buildInfoRow('Date', date),
            vSpace(10),
            _buildInfoRow('Time', time),
            vSpace(10),
            _buildInfoRow('Duration', duration),
            vSpace(15),
            Divider(color: ColorConstant.lightestGrey, thickness: 1),
            vSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MedAppText(
                  'Total',
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                MedAppText(
                  '\$${total.toStringAsFixed(2)}',
                  color: ColorConstant.primaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            vSpace(20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: MedAppText(
                  'Done',
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmallAppText(
          label,
          color: ColorConstant.lightestGrey,
          fontSize: 14.sp,
        ),
        MedAppText(
          value,
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}


