import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visiteo/themes/app_color.dart';

class CustomDateFormField extends StatefulWidget {
  const CustomDateFormField({
    Key? key,
    required this.label,
    required this.hintText,
    this.validator,
    this.onChange,
    required this.controller,
    this.iconData,
  }) : super(key: key);

  final IconData? iconData;
  final String hintText;
  final String label;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final TextEditingController controller;

  @override
  State<CustomDateFormField> createState() => _CustomDateFormFieldState();
}

class _CustomDateFormFieldState extends State<CustomDateFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          onTap: () {
            selectDate(context);
          },
          readOnly: true,
          controller:
              widget.controller, // Utilisation du TextEditingController fourni
          keyboardType: TextInputType.datetime,
          validator: widget.validator,
          onChanged: widget.onChange,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: widget.hintText,
            hintStyle:
                TextStyle(color: Theme.of(context).hintColor, fontSize: 14),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            prefixIcon: widget.iconData != null
                ? Icon(
                    widget.iconData,
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
              borderRadius: BorderRadius.circular(12.0),
            ),
            filled: true,
          ),
        ),
      ],
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      cancelText: "Annuler",
      confirmText: "Valider",
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 8),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        widget.controller.text = DateFormat("dd/MM/yyyy").format(pickedDate);
      });
      if (widget.onChange != null) {
        widget.onChange!(pickedDate.toString());
      }
    }
  }
}
