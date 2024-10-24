import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_tawsel/core/theme/theme.dart';
import 'package:student_tawsel/features/auth/persentation/login_page.dart';
import 'package:student_tawsel/features/auth/persentation/login_parent_page.dart';
import 'package:student_tawsel/features/auth/persentation/signup_page.dart';
import 'package:student_tawsel/firebase_options.dart';
import 'package:student_tawsel/features/presentantion/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _changeLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: _locale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: AppTheme.lightThemeMode, // Light theme defined in AppTheme
        darkTheme: AppTheme.darkThemeMode, // Dark theme defined in AppTheme
        themeMode: ThemeMode.system,
        supportedLocales: S.delegate.supportedLocales,
        home:
           
            HomePage(onLocaleChange: _changeLocale));
  }
}
