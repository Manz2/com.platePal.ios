import 'package:flutter/material.dart';
import 'package:plate_pal/config.dart';
import 'details_config.dart';

const double symHorizontalPadding = 10;
Padding globalSidePadding({required Widget child}) {
  return (Padding(
      padding: const EdgeInsets.symmetric(horizontal: symHorizontalPadding),
      child: child));
}

class GenericCard extends StatelessWidget {
  final String title;
  final Widget icon;
  final Widget? extendedContent;
  final TextStyle? titleStyle;
  final bool? addBottomPadding;

  final void Function()? onPressed;

  const GenericCard(
      {required this.icon,
      required this.title,
      super.key,
      this.extendedContent,
      this.onPressed,
      this.titleStyle,
      this.addBottomPadding});

  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
        child: globalSidePadding(
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: ForegroundColor,
                child: Column(children: [
                  Row(children: [
                    icon,
                    Flexible(
                        child: Text(title,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: titleStyle ??
                                TextStyle(
                                  color: ObjectSecondaryColor,
                                  fontStyle: FontStyle.italic,
                                  fontSize: currentFontSize.toDouble(),
                                ))),
                  ]),
                  globalSidePadding(
                      child: Center(
                          child: (extendedContent != null &&
                                  (addBottomPadding ?? false))
                              ? Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: extendedContent)
                              : extendedContent)),
                ]))),
        onTap: onPressed));
  }
}
