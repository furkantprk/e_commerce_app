import 'package:flutter/material.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String labelText;
  final Icon prefixIcon;

  SearchBar({
    required this.controller,
    required this.onChanged,
    required this.labelText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: ScreenSizeHelper.screenWidth * 0.04),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          labelText: labelText,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
