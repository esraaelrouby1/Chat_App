import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String Message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        Message,
      ),
    ),
  );
}
