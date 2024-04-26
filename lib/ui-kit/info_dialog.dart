import 'package:flutter/material.dart';
import 'package:plate_pal/config.dart';

class InfoDialog {
  final String title;
  final String message;
  const InfoDialog({
    required this.message,
    required this.title,
  });

  void display(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: currentScheme.getScheme().primary),
        ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
