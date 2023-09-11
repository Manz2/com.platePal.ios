import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/screens/erstellen/erstellen_view.dart';

class AddTextFieldWidgetSteps extends StatefulWidget {
  final ErstellenController con;
  final List<String> steps;

  const AddTextFieldWidgetSteps(
      {super.key, required this.con, required this.steps});

  @override
  AddTextFieldWidgetState createState() => AddTextFieldWidgetState();
}

class AddTextFieldWidgetState extends State<AddTextFieldWidgetSteps> {
  final TextEditingController _textEditingController = TextEditingController();

  void _addTextFieldValue() {
    String stepText = _textEditingController.text.trim();

    if (stepText.isNotEmpty) {
      widget.con.addStep(stepText);
      _textEditingController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(FlutterI18n.translate(context, "create.stepTxt")),
        ),
      );
    }
  }

  void _removeTextFieldValue(String value) {
    widget.con.deleteStep(value);
  }

  void _reorderTextFieldValue(int oldIndex, int newIndex) {
    final String step = widget.steps[oldIndex];
    _removeTextFieldValue(step);
    if (newIndex < oldIndex) {
      widget.con.insertStep(newIndex, step);
    } else {
      //Falls Element nach unten  wandert verschieben sich die Indizes,
      // da es zuerst gelöscht wurde
      widget.con.insertStep(newIndex - 1, step);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReorderableListView(
          shrinkWrap: true,
          scrollController: ScrollController(),
          physics: const ClampingScrollPhysics(),
          onReorder: (oldIndex, newIndex) {
            _reorderTextFieldValue(oldIndex, newIndex);
          },
          children: [
            for (int index = 0; index < widget.steps.length; index++)
              ListTile(
                key: Key('$index'),
                leading: const Icon(Icons.drag_handle),
                title: Text(widget.steps[index],
                    style: TextStyle(fontSize: currentFontSize.toDouble())),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _removeTextFieldValue(widget.steps[index]),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: TextField(
                style: TextStyle(fontSize: currentFontSize.toDouble()),
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: FlutterI18n.translate(context, "create.step"),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    labelStyle: TextStyle(
                        fontSize: currentFontSize.toDouble(),
                        color: widget.con.getStepsNotSet()
                            ? currentScheme.getScheme().error
                            : currentScheme.getScheme().onSurfaceVariant)),
                maxLines: null,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _addTextFieldValue,
            ),
          ],
        ),
      ],
    );
  }
}
