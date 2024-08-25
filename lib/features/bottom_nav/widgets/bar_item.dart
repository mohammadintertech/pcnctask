import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final bool isSelected;
  BarItem({required this.icon, required this.isSelected, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        Text(title),
      ],
    );
  }
}
