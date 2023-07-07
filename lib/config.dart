library config.globals;

import 'package:plate_pal/service/locale_service.dart';
import 'package:plate_pal/service/scheme_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

SchemeService currentScheme = SchemeService();
late LocaleService localeS = LocaleService();
int currentFontSize = prefs.getInt('fontSize') ?? 18;
late SharedPreferences prefs;