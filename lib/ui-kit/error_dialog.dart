import 'package:flutter/material.dart';
import '../config.dart';

class ErrorDialog {
  final String title;
  final String message;
  const ErrorDialog({
    required this.message,
    required this.title,
  });

  void display(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: currentScheme.getScheme().error),
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
