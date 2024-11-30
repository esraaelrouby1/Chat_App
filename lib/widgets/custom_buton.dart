import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  CustomButon({super.key, required this.onTap, required this.title});
  VoidCallback? onTap;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: Color.fromARGB(255, 124, 29, 138),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              // fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
