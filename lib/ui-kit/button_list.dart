import 'package:flutter/material.dart';

import '../config.dart';

class ButtonList extends StatelessWidget {
  final Map<Locale, String> buttonMap;

  const ButtonList({super.key, required this.buttonMap});


  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];
    buttonMap.forEach((languageCode, displayName) {
      list.add( Padding(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
        child: InkWell(
          onTap: () {},
          onHover: (value) {},
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              localeS.setLocale(languageCode);
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: currentScheme.getScheme().primary),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Text(
                          displayName,
                          style: TextStyle(
                            fontSize: currentFontSize.toDouble(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
    });
    list.add(const Padding( padding: EdgeInsets.only(bottom: 30)));
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: list);
  }
}
