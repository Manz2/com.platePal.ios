import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/screens/erstellen/erstellen_view.dart';
import 'package:plate_pal/screens/home/home_model.dart';

class AddTextFieldWidget extends StatefulWidget {
  final ErstellenController con;
  final List<Ingredient> ingredients;
  const AddTextFieldWidget(
      {super.key, required this.con, required this.ingredients});
  @override
  AddTextFieldWidgetState createState() => AddTextFieldWidgetState();
}

class AddTextFieldWidgetState extends State<AddTextFieldWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingControllerAmmount =
      TextEditingController();

  void _addTextFieldValue() {
    String ingredientName = _textEditingController.text.trim();
    String ingredientAmount = _textEditingControllerAmmount.text.trim();

    if (ingredientName.isNotEmpty && ingredientAmount.isNotEmpty) {
      Ingredient ingredient =
          Ingredient(name: ingredientName, amount: ingredientAmount);
      widget.con.addZutat(ingredient);
      _textEditingController.clear();
      _textEditingControllerAmmount.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(FlutterI18n.translate(context, "create.ingredientFields")),
        ),
      );
    }
  }

  void _removeTextFieldValue(Ingredient value) {
    widget.con.deleteZutat(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (Ingredient value in widget.ingredients)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "${value.name}   ${value.amount}",
                  style: TextStyle(fontSize: currentFontSize.toDouble()),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _removeTextFieldValue(value),
              ),
            ],
          ),
        Row(
          children: [
            Expanded(
              child: TextField(
                style: TextStyle(fontSize: currentFontSize.toDouble()),
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText:
                        FlutterI18n.translate(context, "create.ingredient"),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    labelStyle: TextStyle(
                        fontSize: currentFontSize.toDouble(),
                        color: widget.con.getIngridientsNotSet()
                            ? currentScheme.getScheme().error
                            : currentScheme.getScheme().onSurfaceVariant)),
                textInputAction: TextInputAction.next,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: TextField(
                  style: TextStyle(fontSize: currentFontSize.toDouble()),
                  controller: _textEditingControllerAmmount,
                  decoration: InputDecoration(
                      labelText:
                          FlutterI18n.translate(context, "create.ammount"),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      labelStyle: TextStyle(
                          fontSize: currentFontSize.toDouble(),
                          color: widget.con.getIngridientsNotSet()
                              ? currentScheme.getScheme().error
                              : currentScheme.getScheme().onSurfaceVariant)),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.check,
                size: currentFontSize.toDouble(),
              ),
              onPressed: _addTextFieldValue,
            ),
          ],
        ),
      ],
    );
  }
}
