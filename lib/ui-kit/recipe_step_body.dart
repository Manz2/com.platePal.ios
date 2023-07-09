import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/screens/details/details_constants.dart';

class RecipeStepBody extends StatelessWidget {
  final bool highlighted;
  final double normalFontSize = currentFontSize.toDouble();
  final double highlightedFontSize = currentFontSize.toDouble();
  final List<TextSpan> richTextSpans;
  final String stepText;
  final GestureRecognizer? recognizer;

  RecipeStepBody(
      {super.key,
      required this.highlighted,
      required this.richTextSpans,
      required this.stepText,
      this.recognizer});

  @override
  Widget build(BuildContext context) {
    return symPadding(
        Row(children: [
          Text(
            stepText + "   ",
            style: TextStyle(
              color: highlighted ? HighlightedTextColor : ObjectPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: highlighted ? highlightedFontSize : normalFontSize,
            ),
          ),
          Expanded(
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: highlighted
                        ? HighlightedTextBackgroundColor
                        : ForegroundColor,
                  ),
                  child: Wrap(children: [
                    RichText(
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: richTextSpans))
                  ]),
                ),
              ],
            ),
          ),
        ]),
        vertical: 4.5);
  }
}
