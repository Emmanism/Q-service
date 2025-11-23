
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quickservice/src/core/constant/color_constant.dart';
import 'package:quickservice/src/shared/widget/space.dart';
import 'package:quickservice/src/shared/widget/text.dart';

class MMTextField extends ConsumerStatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String headerText;
  final FontWeight headerTextFontWeight;
  final double headerTextFontSize;
  final Color? headerTextColor;
  final Color? fillColor;
  final String? hintText;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final bool enablePaste;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final String? Function(String?)? validate;
  final Function()? onEditingComplete;
  final List<TextInputFormatter> inputFormatters;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final bool? enabled;
  final double hintTextFontSize;
  final FontWeight? hintTextFontWeight;
  final InputBorder inputBorder;
  final TextCapitalization textCapitalization;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final double? radius;
  final double? height;
  final Color? borderColor;
  final bool isAuthField;
  final InputBorder? borderDecoration;
  final void Function(String)? onFieldSubmitted;

  const MMTextField(
      {super.key,
      this.controller,
      this.textInputAction,
      this.keyboardType,
      this.height,
      this.obscureText = false,
      this.headerText = "",
      this.headerTextFontWeight = FontWeight.w400,
      this.headerTextFontSize = 10,
      this.hintText,
      this.suffix,
      this.borderColor,
      this.prefix,
      this.prefixIcon,
      this.validate,
      this.suffixIcon,
      this.textAlign = TextAlign.start,
      this.maxLength,
      this.onEditingComplete,
      this.onChanged,
      this.radius,
      this.focusNode,
      this.enablePaste = true,
      this.onTap,
      this.readOnly = false,
      this.enabled,
      this.hintTextFontSize = 10,
      this.hintTextFontWeight = FontWeight.w400,
      this.inputFormatters = const [],
      this.textCapitalization = TextCapitalization.none,
      this.inputBorder = const OutlineInputBorder(),
      this.fontSize = 12,
      this.fontWeight = FontWeight.w400,
      this.maxLines = 1,
      this.headerTextColor,
      this.fillColor,
      this.isAuthField = false,
      this.onFieldSubmitted,
      this.borderDecoration});

  @override
  ConsumerState<MMTextField> createState() => _MMTextFieldState();
}

class _MMTextFieldState extends ConsumerState<MMTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    if (widget.isAuthField) {
      _obscureText = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.headerText.isNotEmpty
            ? MedAppText(
                widget.headerText,
                fontSize: widget.headerTextFontSize,
                fontWeight: widget.headerTextFontWeight,
                color: widget.headerTextColor ?? ColorConstant.primaryColor,
              )
            : const SizedBox.shrink(),
        SizedBox(height: 8.h),
        SizedBox(
          height: widget.height ?? 65.h,
          child: TextFormField(
            onFieldSubmitted: widget.onFieldSubmitted,
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textCapitalization: widget.textCapitalization,
            onEditingComplete: widget.onEditingComplete,
            maxLines: widget.maxLines,
            contextMenuBuilder:
                (BuildContext context, EditableTextState editableTextState) {
              return AdaptiveTextSelectionToolbar.editable(
                anchors: editableTextState.contextMenuAnchors,
                clipboardStatus: ClipboardStatus.pasteable,
                onCopy: () => editableTextState
                    .copySelection(SelectionChangedCause.toolbar),
                onCut: () => editableTextState
                    .cutSelection(SelectionChangedCause.toolbar),
                onPaste: () {
                  editableTextState.pasteText(SelectionChangedCause.toolbar);
                },
                onSelectAll: () =>
                    editableTextState.selectAll(SelectionChangedCause.toolbar),
                onLiveTextInput: () {},
                onLookUp: () {},
                onSearchWeb: () {},
                onShare: () {},
              );
            },
            cursorColor: ColorConstant.primaryColor,
            enabled: widget.enabled,
            /* validator: widget.validate ??
                (v) => (v?.isEmpty ?? true) ? 'Field is required' : null, */
            textInputAction: widget.textInputAction,
            readOnly: widget.readOnly,
            enableInteractiveSelection: widget.enablePaste,
            onChanged: ((value) => widget.onChanged?.call(value)),
            focusNode: widget.focusNode,
            textAlign: widget.textAlign,
            onTap: widget.onTap?.call,
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            obscureText: _obscureText,
            obscuringCharacter: '*',
            style: GoogleFonts.instrumentSans(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: Colors.white
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16.h),
              prefixIconConstraints:
                  BoxConstraints(minHeight: 20.h, minWidth: 20.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: widget.fillColor ?? Colors.transparent,
              errorMaxLines: 1,
              labelStyle: GoogleFonts.inter(
                fontSize: 10.sp,
                color: ColorConstant.lightestGrey,
              ),
              hintText: widget.hintText,
              enabledBorder: widget.borderDecoration ??
                  OutlineInputBorder(
                    borderSide:
                        BorderSide(
                          color: widget.borderColor ?? ColorConstant.lightestGrey, 
                          width: 1),
                    borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
                  ),
              focusedBorder: widget.borderDecoration ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.borderColor ??  ColorConstant.lightestGrey,
                      width: 1),
                    borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
                  ),
              errorBorder: widget.borderDecoration ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
                  ),
              focusedErrorBorder: widget.borderDecoration ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
                  ),
              hintStyle: GoogleFonts.inter(
                textBaseline: TextBaseline.alphabetic,
                fontSize: widget.hintTextFontSize.sp,
                fontWeight: widget.hintTextFontWeight,
                color:  ColorConstant.greyColor
              ),
              suffix: widget.suffix,
              prefix: widget.prefix,
              isDense: true,
              suffixIconConstraints: const BoxConstraints(
                minHeight: 20,
                minWidth: 20,
              ),
              suffixIcon: widget.isAuthField
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: widget.suffixIcon,
                    ),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: widget.prefixIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}




class DropdownTextFormField extends StatelessWidget {
  const DropdownTextFormField({
    required this.hint,
    required this.value,
    this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.label,
    this.items,
    this.isRequired,
    this.radius,
    this.isError = false,
    super.key,
  });

  final String hint;
  final String? value;
  final String? label;
  final List<String>? dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;
  final List<DropdownMenuItem<String>>? items;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final bool? isRequired;
  final double? radius;
  final bool? isError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        DropdownButtonHideUnderline(
          child: SizedBox(
            width: 150.w,
            height: 47,
            child: DropdownButtonFormField2<String>(
        
              value: value,
              isExpanded: true,
              focusNode: focusNode,
              hint: Text(hint,
                  style: GoogleFonts.openSans(
                     color:  Colors.white,
                    fontSize: 14.sp,
                  )),
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 15.sp,
              ),
              items: items,
              onChanged: onChanged,
              selectedItemBuilder: selectedItemBuilder ?? (BuildContext context) {
                return items?.map<Widget>((DropdownMenuItem<String> item) {
                  return Text(
                    item.value ?? '',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  );
                }).toList() ?? [];
              },
              decoration: InputDecoration(
                filled: true,
              fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(10.w),
            borderSide: BorderSide(
              color:  Colors.white,
              width: 1.0,
            ),
                    ),
            focusedBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(10.w),
            borderSide: BorderSide(
              color:Colors.white,
              width: 1.0,
            ),
                    ),
            errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
            focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
             contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              ),
              validator: validator ??
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select at least one option';
                    }
                    return null;
                  },
              dropdownStyleData: DropdownStyleData(
                maxHeight: (dropdownHeight ?? 200).h,
                width: 150.w,
                padding: dropdownPadding ?? const EdgeInsets.all(8),
                decoration: dropdownDecoration ??
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: ColorConstant.lightestGrey,
                     
                    ),
                elevation: dropdownElevation ?? 8,
                offset: offset,
              ),
              iconStyleData: IconStyleData(
                icon: icon ??
                    Icon(
                      IconsaxPlusLinear.arrow_down,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                iconSize: (iconSize ?? 16).sp,
                iconEnabledColor:
                    iconEnabledColor,
                iconDisabledColor:
                    iconDisabledColor,
              ),
              menuItemStyleData: MenuItemStyleData(
                height: (itemHeight ?? 40).h,
                padding: itemPadding ?? EdgeInsets.only(left: 14.w, right: 14.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
