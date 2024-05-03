library config.globals;

import 'package:plate_pal/service/locale_service.dart';
import 'package:plate_pal/service/scheme_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

SchemeService currentScheme = SchemeService();
LocaleService localeS = LocaleService();
int currentFontSize = prefs.getInt('fontSize') ?? 18;
late SharedPreferences prefs;

String prompt = '''
    Wende folgende Anweisung auf alle Rezepte an die du bekommst.
    Hier ist eine beispielhafte Darstellung, wie ein Rezept im JSON Format aussehen soll:
    {
    "title": "Titel",
    "description": "beschreibung",
    "guideText": [
    "Zwiebeln schneiden",
    "Tomate schneiden"
    ],
    "ingredients": [
    {
    "amount": "1 Stück",
    "name": "Tomate"
    },
    {
    "amount": "1 Stück",
    "name": "Zwiebeln"
    }
    ]
    }
    
    Suche  folgende  Elemente im FLießtext und trage sie im JSON ein:
    Identifiziere falls möglich eine Kurzbeschreibung und trage es unter description ein.
    Identifiziere falls möglich die Anleitung zur zubereitung und trage sie unter guideText ein.
    Identifiziere falls möglich die Zutatenund trage sie unter ingredients ein.
    Identifiziere falls möglich den Namen des Rezepts und trage ihn unter title ein.
    Wichtig: Antworte nur mit dem neuen JSON String, der die Informationen aus dem Fließtext enthält, keine Erklärung."
    ''';
