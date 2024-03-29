import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class NameInputController extends StatelessWidget {
  const NameInputController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    String enteredName;
    return AlertDialog(
      title: const Text(
        "Namen Festlegen",
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(FlutterI18n.translate(context, "login.firstlogin")),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Abbruch'),
          child: const Text('Abbrechen'),
        ),
        TextButton(
          onPressed: () => {
            enteredName = nameController.text,
            Navigator.pop(context, enteredName),
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
