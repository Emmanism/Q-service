import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickservice/src/core/constant/color_constant.dart';
import 'package:quickservice/src/features/booking_screen/controller/booking_controller.dart';
import 'package:quickservice/src/features/booking_screen/model/booking_model.dart';
import 'package:quickservice/src/features/booking_screen/widget/booking_confirmation_dialog.dart';
import 'package:quickservice/src/features/booking_screen/widget/grid_selector.dart';
import 'package:quickservice/src/features/booking_screen/widget/hour_selector.dart';
import 'package:quickservice/src/features/provider_list_screen/model/provider_model.dart';
import 'package:quickservice/src/features/booking_screen/widget/date_widget.dart';
import 'package:quickservice/src/shared/widget/button.dart';
import 'package:quickservice/src/shared/widget/space.dart';
import 'package:quickservice/src/shared/widget/text.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class BookingScreen extends StatefulWidget {
  final Providers provider;
  const BookingScreen({super.key, required this.provider});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final BookingController _bookingController = BookingController();

  @override
  void dispose() {
    _bookingController.dispose();
    super.dispose();
  }

  void _showConfirmationDialog() {
    final total = _bookingController.calculateTotal(widget.provider.hourlyRate);
    showDialog(
      context: context,
      builder: (context) => BookingConfirmationDialog(
        providerName: widget.provider.name,
        date: _bookingController.selectedDate ?? '',
        time: _bookingController.selectedTime ?? '',
        duration: _bookingController.selectedDuration ?? '',
        total: total,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            mainImageWidget(height),

            Container(
              margin: EdgeInsets.only(top: height / 2.3),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: bottomContent(),
            ),
          ],
        ),
      ),
    );
  }

  //mainImage
  Widget mainImageWidget(height) => Container(
    height: height / 2,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(widget.provider.imageUrl),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 48, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );

  Widget bottomContent() {
    return ListenableBuilder(
      listenable: _bookingController,
      builder: (context, _) {
        final total = _bookingController.calculateTotal(widget.provider.hourlyRate);
        final isBookingValid = _bookingController.isBookingValid;
        
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
            width: width(context),
            child: Padding(
              padding: simPad(10, 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipOval(
                          child: Image.network(
                            widget.provider.imageUrl,
                            height: 50.h,
                            width: 50.w,
                          ),
                        ),
                        hSpace(3),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MedAppText(
                              widget.provider.name,
                              color: ColorConstant.lightestGrey,
                              fontSize: 16.sp,
                            ),
                            SmallAppText(
                              widget.provider.category,
                              color: ColorConstant.lightestGrey,
                              fontSize: 11.sp,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RatingBar(
                              size: 25,
                              emptyColor: Colors.white,
                              filledIcon: Icons.star,
                              emptyIcon: Icons.star_border,
                              onRatingChanged: (value) {},
                              initialRating: widget.provider.rating,
                              maxRating: 5,
                            ),
                            vSpace(5),
                            SmallAppText(
                              '${(widget.provider.hourlyRate.toInt()).toString()}/hr',
                              color: ColorConstant.lightestGrey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    vSpace(5),
                    Divider(thickness: 2, color: Colors.white),
                    vSpace(5),
                    MedAppText(
                      'Select Date',
                      color: ColorConstant.lightestGrey,
                      fontSize: 11.sp,
                    ),
                    vSpace(10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: dates.map<Widget>((date) {
                        return DateWidget(
                          date: date,
                          onTap: () {
                            _bookingController.setSelectedDate(date);
                          },
                          isSelected: _bookingController.selectedDate == date, 
                        );
                      }).toList(),
                    ),
                    vSpace(10),
                    MedAppText(
                      'Select Time',
                      color: ColorConstant.lightestGrey,
                      fontSize: 11.sp,
                    ),
                    SizedBox(
                      width: width(context),
                      height:100.h,
                      child: ResponsiveGridList(
                        verticalGridSpacing: 5,
                        verticalGridMargin: 0,
                        minItemWidth: 39.w,
                        maxItemsPerRow: 3,
                        minItemsPerRow: 3,
                        children: times.map((time) {
                          return GridSelector(
                            isSelected: _bookingController.selectedTime == time.time,
                            time:time,
                            onTap: time.isBooked ? null : (){
                              _bookingController.setSelectedTime(time.time, isBooked: time.isBooked);
                            },
                          );
                        }).toList()
                      )
                    ),
                    vSpace(15),
                    HourSelector(
                      onDurationChanged: (duration) {
                        _bookingController.setSelectedDuration(duration);
                      },
                    ),
                    vSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallAppText(
                              'Total Price',
                              color: Colors.white,
                              fontSize: 13,
                            ),
                            vSpace(2),
                            MedAppText(
                              total > 0 
                                  ? '\$${total.toStringAsFixed(2)}'
                                  : '\$${widget.provider.hourlyRate.toInt().toString()}/hr',
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                        BButton(
                          text: 'Book Now',
                          width: 180.w,
                          onTap: isBookingValid ? _showConfirmationDialog : null,
                          color: ColorConstant.primaryColor,
                          isEnabled: isBookingValid,
                        ),
                      ],
                    ),
                    vSpace(25),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
