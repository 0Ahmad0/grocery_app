import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/string_manager.dart';

import '../../core/utils/color_manager.dart';

class AppTextField extends StatefulWidget {
  AppTextField(
      {Key? key,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.iconData,
      this.hintText,
      this.obscureText = false,
      this.suffixIcon = false,
      this.validator,
      this.onChanged,
      this.onTap,
      this.autofocus = false,
      this.readOnly = false,
      this.maxLine = 1,
      this.minLine = 1,
      this.hintColor = ColorManager.grayColor,
      this.textColor = ColorManager.blackColor,
      this.filteringTextFormatterList,
      this.iconDataImage})
      : super(key: key);

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? iconData;
  final String? iconDataImage;
  final String? hintText;
  final Color? hintColor;
  final Color? textColor;
  final bool suffixIcon;
  final bool autofocus;
  final bool readOnly;
  bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final int? maxLine;
  final int? minLine;
  final List<FilteringTextInputFormatter>? filteringTextFormatterList;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  void showPassword() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: widget.textColor),
      inputFormatters: widget.filteringTextFormatterList,
      maxLines: widget.maxLine,
      minLines: widget.minLine,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      validator: widget.validator ??
          (String? val) {
            if (val!.trim().isEmpty)
              return StringManager.requiredField;
            return null;
          },
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      cursorColor: ColorManager.primaryDarkColor,
      decoration: InputDecoration(
        iconColor: ColorManager.grayColor,
        border: InputBorder.none,
        // focusedErrorBorder: StylesManager.borderTextFiled(
        //     color: ColorManager.secondary, width: 4),
        // errorBorder: StylesManager.borderTextFiled(
        //     color: ColorManager.secondary, width: 4),
        // enabledBorder: StylesManager.borderTextFiled(),
        // focusedBorder: StylesManager.borderTextFiled(width: 4),
        hintStyle: TextStyle(
          color: widget.hintColor,
        ),
        errorMaxLines: 2,
        prefixIcon: (widget.iconData == null && widget.iconDataImage == null)
            ? null
            : widget.iconDataImage != null
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      widget.iconDataImage!,
                      width: 15.sp,
                      height: 15.sp,
                    ),
                  )
                : Icon(
                    widget.iconData,
                    size: 24.sp,
                  ),
        suffixIcon: widget.suffixIcon
            ? IconButton(
                onPressed: () {
                  showPassword();
                },
                icon: Icon(
                  widget.obscureText
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye,
                  color: !widget.obscureText
                      ? ColorManager.primaryDarkColor
                      : ColorManager.primaryDarkColor.withOpacity(.2),
                ))
            : null,
        hintText: widget.hintText,
      ),
    );
  }
}
