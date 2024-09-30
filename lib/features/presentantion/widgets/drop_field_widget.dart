// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class DropFieldWidget extends StatelessWidget {
  final String? formvalue;
  final String hint;
  final String? label;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  const DropFieldWidget(
      {super.key,
      this.formvalue,
      required this.hint,
      this.label,
      required this.items,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        color: Colors.white,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: const Color(0xff2D2D2D),
                  ),
              labelText: label,
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ))),
          value: formvalue,
          hint: hint.isNotEmpty
              ? Text(
                  hint,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: const Color(0xff2D2D2D),
                      ),
                )
              : null,
          items: items.map((String item) {
            return DropdownMenuItem(
                value: item,
                child: Text(item,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff2D2D2D),
                        )));
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
