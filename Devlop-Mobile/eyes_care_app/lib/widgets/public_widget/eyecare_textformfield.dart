import 'package:eyes_care_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EyeCareTextFormFiled extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? errorText;
  final IconData icon;
  final Icon? suffixIcon;
  final void Function()? onSuffixIconPressed;
  final EdgeInsetsGeometry margin;
  final bool isHide;

  const EyeCareTextFormFiled({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    required this.textInputType,
    this.validator,
    this.controller,
    this.errorText,
    required this.icon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.obscureText = false,
    this.margin = const EdgeInsets.all(0),
    this.isHide = false,
  });

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(10.0));
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: margin,
          width: Get.width - 55,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 18, color: Colors.grey),
              labelText: labelText,
              filled: true,
              fillColor: const Color(0xff235C75).withOpacity(0.1),

              // تبديل بين الايكون
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: suffixIcon!,
                      onPressed: onSuffixIconPressed,
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            keyboardType: textInputType,
            validator: validator,
          ),
        ),

        // icon
        Positioned(
          top: -2,
          right: Get.locale?.languageCode == "ar" ? -7 : null,
          left: Get.locale?.languageCode != "ar" ? -7 : null,
          child: MyIcon(
            icon: icon,
            backgroundColor:
                isHide ? Colors.white : const Color(AppColor.primaryColor),
          ),
        ),
      ],
    );
  }
}

class MyIcon extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;

  const MyIcon({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            // blurRadius: 4,
            // spreadRadius: 0,
            // offset: Offset(0, 4),
            color: backgroundColor ?? const Color(0xff000000),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: iconColor ?? Colors.white,
      ),
    );
  }
}

class EyeTextFormFiled extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintTex;
  final Widget? suffixIcon;

  const EyeTextFormFiled({
    super.key,
    this.controller,
    this.onChanged,
    this.hintTex,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        hintText: hintTex,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        prefixIcon:
            const Icon(Icons.search, color: Color.fromARGB(255, 18, 16, 16)),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              const BorderSide(color: Color(AppColor.primaryColor), width: 1.5),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
