import 'package:flutter/material.dart';
import '../config.dart';

class ErrorDialogChoice {
  final String title;
  final String message;
  final String ok;
  final String dismiss;

  const ErrorDialogChoice({
    required this.ok,
    required this.dismiss,
    required this.message,
    required this.title,
  });

  Future<bool?> display(BuildContext context) {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: currentScheme.getScheme().error),
        ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(dismiss),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(ok),
          ),
        ],
      ),
    );
  }
}
