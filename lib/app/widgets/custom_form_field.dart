import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visiteo/themes/app_color.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.label,
    required this.hintText,
    this.inputFormatters,
    this.validator,
    this.onChange,
    this.controller,
    this.iconData,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);
  final IconData? iconData;
  final String hintText;
  final String label;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          style: TextStyle(color: AppColor.textColorLight),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          onChanged: onChange,
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle:
                TextStyle(color: Theme.of(context).hintColor, fontSize: 14),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            prefixIcon: iconData != null
                ? Icon(
                    iconData,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
          ),
        ),
      ],
    );
  }
}
