import 'package:flutter/services.dart';
import 'package:plate_pal/screens/details/details_constants.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:flutter/material.dart';
import 'package:plate_pal/config.dart';
import '../screens/details/details_view.dart';

class IngredientListElem extends StatefulWidget {
  final int ingredientNumber;
  final String ingredientName;
  final String ingredientAmount;
  final bool isInEditMode;
  final bool isHighlighting;
  final DetailsController controller;

  const IngredientListElem({
    required this.ingredientNumber,
    required this.ingredientName,
    required this.ingredientAmount,
    required this.isInEditMode,
    required this.isHighlighting,
    required this.controller,
    super.key,
  });

  @override
  _IngredientCardState createState() => _IngredientCardState();
}

class _IngredientCardState extends State<IngredientListElem> {
  bool isCrossed = false;

  void toggleCrossed() {
    if (!widget.isInEditMode) {
      HapticFeedback.mediumImpact();
      setState(() {
        isCrossed = !isCrossed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEditable = widget.isInEditMode;
    Color crossedColor = ObjectSecondaryColor.withOpacity(0.35);
    Color uncrossedColor = ObjectPrimaryColor;
    int androidWidthThatToggles = 240; //270 emulator, 244 real device
    int browserWidthThatToggles = 200;
    int iosWidthThatToggles = 250;

    int widthLimit = 0;
    if (UniversalPlatform.isAndroid) {
      widthLimit = androidWidthThatToggles;
    } else if (UniversalPlatform.isIOS) {
      widthLimit = iosWidthThatToggles;
    } else {
      widthLimit = browserWidthThatToggles;
    }

    crossOnTap() => {
          toggleCrossed(),
          if (widget.isHighlighting)
            {
              widget.controller
                  .toggleIngredientHighlightingFocus(widget.ingredientName)
            },
        };

    return GestureDetector(
      onTap: crossOnTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: !isCrossed ? ForegroundColor : BackgroundColor,
        // Content of Panel:
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: crossOnTap,
              child: Container(
                child: symPadding(
                  LineText(
                    !isCrossed
                        ? (widget.ingredientNumber).toString() + "."
                        : "✓",
                    TextStyle(
                      color: ObjectPrimaryColor,
                      fontWeight:
                          !isCrossed ? FontWeight.bold : FontWeight.normal,
                      fontSize: currentFontSize.toDouble(),
                    ),
                  ),
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  color: !isCrossed
                      ? ObjectSecondaryColor.withOpacity(0.35)
                      : ObjectSecondaryColor.withOpacity(0.25),
                  border: Border.all(
                    color: isCrossed ? crossedColor : uncrossedColor,
                    width: 2,
                  ),
                ),
                margin: const EdgeInsets.all(5),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth < widthLimit) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //SMALL SCREENS:
                        LineText(
                          widget.ingredientName,
                          TextStyle(
                            color: isCrossed ? crossedColor : uncrossedColor,
                            fontSize: currentFontSize.toDouble(),
                            decoration:
                                isCrossed ? TextDecoration.lineThrough : null,
                          ),
                          isEditable: isEditable,
                          onSubmit: controller.ingredientNameChanged,
                        ),
                        LineText(
                          widget.ingredientAmount,
                          TextStyle(
                            color: isCrossed ? crossedColor : uncrossedColor,
                            fontSize: currentFontSize.toDouble(),
                            decoration:
                                isCrossed ? TextDecoration.lineThrough : null,
                          ),
                          align: TextAlign.right,
                          isEditable: isEditable,
                          onSubmit: functionWrapperForAmount,
                          context: widget.ingredientName,
                        ),
                      ],
                    );
                  } else {
                    // FOR BIGGER SCREENS ALL IN ONE LINE:
                    return Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        LineText(
                          " " + widget.ingredientName,
                          TextStyle(
                            color: isCrossed ? crossedColor : uncrossedColor,
                            fontSize: currentFontSize.toDouble(),
                            decoration:
                                isCrossed ? TextDecoration.lineThrough : null,
                          ),
                          isEditable: isEditable,
                          onSubmit: controller.ingredientNameChanged,
                        ),
                        LineText(
                          " " + widget.ingredientAmount,
                          TextStyle(
                            color: isCrossed
                                ? crossedColor
                                : (widget.isHighlighting)
                                    ? HighlightedTextColor
                                    : uncrossedColor,
                            fontSize: currentFontSize.toDouble(),
                          ),
                          align: TextAlign.right,
                          isEditable: isEditable,
                          onSubmitWithContext: functionWrapperForAmount,
                          context: widget.ingredientName,
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            IconButton(
              icon: Icon(
                isEditable ? Icons.drag_handle : Icons.info,
                color: (isCrossed)
                    ? crossedColor
                    : ((widget.isHighlighting && !isEditable)
                        ? HighlightedTextColor
                        : uncrossedColor),
              ),
              onPressed: !isEditable
                  ? !isCrossed
                      ? () => {
                            controller //highlight Steps of this ingredient
                                .toggleIngredientHighlightingFocus(
                                    widget.ingredientName)
                          }
                      : null // do nothing when crossed out and not editable,
                  : null // otherwise move ingredient order
              ,
              iconSize: iconObjSize,
            ),
          ],
        ),
      ),
    );
  }

  //benötige diese Funktion um LineText stateless zu halten.
  void functionWrapperForAmount(
      String ingredientName, String oldAmount, String newAmount) {
    widget.controller.ingredientAmountChanged(ingredientName, newAmount);
  }
}

FocusNode focusNode = FocusNode(); //only one cursor at a time

// Diese Funktion agiert wie ein Material Widget und ist daher großgeschrieben:
// ignore: non_constant_identifier_names
Widget LineText(String text, TextStyle style,
    {TextAlign? align,
    TextOverflow? overflow,
    bool? isEditable,
    Function? onSubmit, //set either this,
    Function? onSubmitWithContext, //or both of these:
    Object? context}) {
  String latestText = text;

  callParentFunction(newText) => {
        if (onSubmit != null)
          {onSubmit(text, newText)}
        else if (onSubmitWithContext != null)
          {onSubmitWithContext(context, text, newText)}
      };

  if (!(isEditable ?? false)) {
    return Text(
      maxLines: 1,
      text,
      style: style,
      textAlign: align ?? TextAlign.left,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  } else {
    return Focus(
      focusNode: focusNode,
      onFocusChange: (hasFocus) {
        if (!hasFocus) callParentFunction(latestText);
      },
      child: EditableText(
        controller: TextEditingController(text: text),
        maxLines: 1,
        style: style,
        textAlign: align ?? TextAlign.left,
        backgroundCursorColor: BackgroundColor,
        cursorColor: ObjectPrimaryColor,
        focusNode: FocusNode(),
        onChanged: (value) => latestText = value,
        onSubmitted: (value) => callParentFunction(value),
      ),
    );
  }
}
/* info: 
  LineText ist ein Widget dass zu einem editierbaren Text mutieren kann,
  während sich der Stil der Textanzeige innerhalb einer Zeile nicht ändert.
  Es wird die Funktion aufgerufen, die in onSubmit übergeben wird,
  wenn der Text geändert wird oder der Fokus verloren geht. 
  LineText kann global:
   ausgelagert werden um auch in anderen Klassen verwendet zu werden und hat 
   daher absichtlich keine Dependencies zur Klasse ingredient_list_elem.dart
  Es wurde evaluiert LineText als StatefulWidget zu implementieren jedoch ist
  z.B. initState() und die restliche Syntax unnötige zusätzliche Komplexität */
