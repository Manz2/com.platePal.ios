library config.globals;

import 'package:plate_pal/service/locale_service.dart';
import 'package:plate_pal/ui-kit/color_schemes.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

PlatePalColorScheme currentScheme = PlatePalColorScheme();
late LocaleService localeS = LocaleService();
int currentFontSize = prefs.getInt('fontSize') ?? 18;
late SharedPreferences prefs;