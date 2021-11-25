import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  const IconLabel({required this.icon, required this.label});

  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(children:  [
      icon,
      Text(label),
    ],);
  }
}
