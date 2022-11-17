import 'package:flutter/material.dart';

// ignore: camel_case_types
class widget_container extends StatelessWidget {
  const widget_container({
    // ignore: non_constant_identifier_names
    Key? key,
    // ignore: non_constant_identifier_names
    required this.Selected,
    required this.marginEnd,
  }) : super(key: key);

// ignore: non_constant_identifier_names
  final bool Selected;
  final double marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 17,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Selected ? const Color(0xff6A90F2) : Colors.grey,
      ),
    );
  }
}
