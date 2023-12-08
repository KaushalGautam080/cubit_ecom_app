import 'package:flutter/material.dart';

class CusTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final double? height;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String?)? onChanged;
  final String? initialValue;
  final String hintText;
  final double hPad;
  final Widget? prefixIcon;
  final BoxConstraints? prefixBoxCon;
  final Function()? prefixOnTap;
  final Widget? suffixIcon;
  final BoxConstraints? suffixBoxCon;
  final Function()? suffixOnTap;

  const CusTextForm({
    super.key,
    this.controller,
    this.title,
    this.height,
    required this.keyboardType,
    required this.obscureText,
    required this.onChanged,
    this.initialValue,
    required this.hintText,
    required this.hPad,
    this.prefixIcon,
    required this.prefixBoxCon,
    this.prefixOnTap,
    required this.suffixIcon,
    this.suffixBoxCon,
    this.suffixOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Column(
            children: [Text(title!)],
          ),
        SizedBox(
          height: height,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            initialValue: initialValue,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              prefixIconConstraints: prefixBoxCon,
              suffixIcon: suffixIcon,
              suffixIconConstraints: suffixBoxCon,
              hintText: hintText,
            ),
          ),
        )
      ],
    );
  }
}
