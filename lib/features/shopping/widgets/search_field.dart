import 'package:flutter/material.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:pcnc_task/main.dart';
import 'package:sizer/sizer.dart';

class SearchField extends StatefulWidget {
  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, top: 8, right: 15, left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search any product",
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 167, 167, 167),
            fontWeight: FontWeight.normal,
          ),
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: const Color.fromARGB(255, 167, 167, 167),
          ),
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
