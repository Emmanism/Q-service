import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallAppText extends StatelessWidget {
  SmallAppText(this.data,
      {super.key,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.alignment,
      this.overflow,
      this.maxLines,
      this.canCopy,
      this.decoration});
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? alignment;
  final bool? canCopy;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (canCopy == true) {
          Clipboard.setData(ClipboardData(text: data));
        }
      },
      child: Text(
        data,
        textAlign: alignment,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines ?? 999,
        style: GoogleFonts.instrumentSans(
          textStyle: const TextStyle(
            fontFamilyFallback: ['Roboto'],
          ),
          color: color ?? Colors.black,
          fontSize: (fontSize ?? 12).sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          decoration: decoration,
        ),
      ),
    );
  }
}

class MedAppText extends StatelessWidget {
  MedAppText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.maxLines,
    this.alignment,
    this.canCopy,
  });
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? alignment;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? canCopy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (canCopy == true) {
          Clipboard.setData(ClipboardData(text: data));
        }
      },
      child: Text(
        data,
        textAlign: alignment,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines ?? 999,
        style: GoogleFonts.instrumentSans(
          textStyle: const TextStyle(
            fontFamilyFallback: ['Roboto'],
          ),
          color: color ?? Colors.black,
          fontSize: (fontSize ?? 16).sp, 
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      ),
    );
  }
}

class BigAppText extends StatelessWidget {
  BigAppText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.canCopy,
  });
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool? canCopy;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (canCopy == true) {
          Clipboard.setData(ClipboardData(text: data));
        }
      },
      child: Text(
        data,
        textAlign: textAlign ?? TextAlign.left,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines ?? 999,
        style: GoogleFonts.instrumentSans(
          color: color ?? Colors.black,
          fontSize: (fontSize ?? 20).sp, 
          fontWeight: fontWeight ?? FontWeight.w800,
        ),
      ),
    );
  }
}
