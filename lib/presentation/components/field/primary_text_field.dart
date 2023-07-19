import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final int? maxLength;
  final bool readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? placeholder;
  final String? label;
  final String? errorText;

  const PrimaryTextField({
    super.key,
    this.maxLength,
    this.onTap,
    this.onChanged,
    this.controller,
    this.textInputType,
    this.placeholder,
    this.label,
    this.readOnly = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      maxLength: maxLength,
      readOnly: readOnly,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      keyboardType: textInputType,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        hintText: placeholder,
        labelText: label,
        errorBorder: borderWith(color: Colors.red),
        focusedErrorBorder: borderWith(color: Colors.red),
        errorText: errorText,
        fillColor: Colors.white,
        hintStyle: labelTextStyle(),
        labelStyle: labelTextStyle(),
        focusedBorder: borderWith(),
        enabledBorder: borderWith(),
      ),
    );
  }

  labelTextStyle() {
    return TextStyle(
      color: Colors.black.withOpacity(0.5),
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
  }

  borderWith({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color ?? Colors.grey, width: 0.8),
    );
  }
}
