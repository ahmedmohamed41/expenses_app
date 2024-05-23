import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.inputType,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.onSubmit,
    this.validator,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isEnabled,
    this.suffixPressed,
    this.isPassword = false,
    this.maxLength,
    this.prefixText,
  });
  final bool isPassword;
  final String? prefixText;
  final int? maxLength;
  final String labelText;
  final int maxLines;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final bool? isEnabled;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onSubmit;
  final void Function()? suffixPressed;
  final String? Function(String?)? validator;

  final TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        maxLength: maxLength,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        enabled: isEnabled,
        controller: controller,
        onTap: onTap,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
        keyboardType: inputType,
        maxLines: maxLines,
        style: const TextStyle(fontSize: 15.0),
        decoration: InputDecoration(
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(suffixIcon),
                )
              : null,
          prefixIcon: prefixIcon,
          prefixText: prefixText,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(9),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }
}
