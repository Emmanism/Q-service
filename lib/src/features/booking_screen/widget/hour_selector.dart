import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickservice/src/features/booking_screen/model/booking_model.dart';
import 'package:quickservice/src/shared/widget/text.dart';
import 'package:quickservice/src/shared/widget/textfield.dart';

class HourSelector extends StatefulWidget {
  final ValueChanged<String?>? onDurationChanged;
  
  const HourSelector({
    super.key,
    this.onDurationChanged,
  });

  @override
  State<HourSelector> createState() => _HourSelectorState();
}

class _HourSelectorState extends State<HourSelector> {
  String? selectedHour;

  @override
  Widget build(BuildContext context) {
    return DropdownTextFormField(
    
      dropdownWidth: 150.w,
      hint: 'Select',
      items: hours.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: SmallAppText(item, maxLines: 1),
        );
      }).toList(),
      value: selectedHour,
      onChanged: (String? value) {
         setState(() {
          selectedHour = value; 
        });
        widget.onDurationChanged?.call(value);
      },
    );
  }
}