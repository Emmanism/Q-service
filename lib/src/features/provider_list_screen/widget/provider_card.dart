import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quickservice/src/core/constant/color_constant.dart';
import 'package:quickservice/src/features/provider_list_screen/model/provider_model.dart';
import 'package:quickservice/src/shared/widget/button.dart';
import 'package:quickservice/src/shared/widget/elevated_container.dart';
import 'package:quickservice/src/shared/widget/navigation.dart';
import 'package:quickservice/src/shared/widget/space.dart';
import 'package:quickservice/src/shared/widget/text.dart';

class ProviderCard extends StatelessWidget {
  final Providers provider;
  const ProviderCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return elevatedContainer(
      bgColor: ColorConstant.lightestGrey,
      height: 100,
      child: Padding(
        padding: simPad(15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Image.network(
                    provider.imageUrl,
                    height: 50.h,
                    width: 50.w,
                  ),
                ),
                hSpace(3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallAppText(provider.category, fontSize: 13),
                    vSpace(5),
                    SmallAppText(
                      '${(provider.hourlyRate.toInt()).toString()}/hr',
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: BButton(
                    width: 90,
                    height: 40,
                    text: 'Book now',
                    radius: 10,
                    fontSize: 13,
                    onTap: () {
                      
                    },
                  ),
                ),
              ],
            ),
            vSpace(30),
            elevatedContainer(
              bgColor: ColorConstant.primaryColor,
              child: Padding(
                padding: simPad(15, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallAppText(
                          'Service Rating',
                          color: ColorConstant.lightestGrey,
                        ),
                        RatingBar(
                          emptyColor: Colors.white,
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          onRatingChanged: (value) {},
                          initialRating: provider.rating,
                          maxRating: 5,
                        ),
                      ],
                    ),
                    vSpace(10),
                    Divider(thickness: 2, color: Colors.white),
                    vSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallAppText(
                          'Service Provider',
                          color: ColorConstant.lightestGrey,
                        ),
                        Row(
                          children: [
                            SmallAppText(
                              provider.name,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                            hSpace(2),
                            provider.isVerified ?
                            Icon(IconsaxPlusLinear.verify, color: Colors.white)
                            : SizedBox.shrink(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
