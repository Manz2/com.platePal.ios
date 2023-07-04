import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class AddGroupMemberController extends StatelessWidget {
  const AddGroupMemberController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _idController = TextEditingController();
    String enteredName;
    return AlertDialog(
      title: Text(FlutterI18n.translate(context, "account.addGroupMemver")),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(FlutterI18n.translate(context, "account.enterId")),
          TextField(
            controller: _idController,
            decoration: const InputDecoration(
              hintText: 'id',
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
            enteredName = _idController.text,
            Navigator.pop(context, enteredName),
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
