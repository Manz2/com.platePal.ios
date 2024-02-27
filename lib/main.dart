import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:plate_pal/common/providers.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState {
  @override
  void initState() {
    super.initState();
    localeS.addListener(() {
      setState(() {});
    });
    currentScheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    MyAppNavigationService navigationservice = ref.read(
        providers.navigationServiceProvider
            as ProviderListenable<MyAppNavigationService>);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'PlatePal',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: currentScheme.getScheme(),
      ),
      localizationsDelegates: [
        FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(
              useCountryCode: false,
              basePath: "assets/i18n",
              forcedLocale: localeS.getLocale(),
              decodeStrategies: <JsonDecodeStrategy>[JsonDecodeStrategy()]),
          missingTranslationHandler: (key, locale) {
            logger.d(
                "--- Missing Key: $key, languageCode: ${locale?.languageCode}");
          },
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      routeInformationParser: BeamerParser(),
      routerDelegate: navigationservice.getRouterDelegate,
    );
  }
}
