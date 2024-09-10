// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Mohamed`
  String get profileName {
    return Intl.message(
      'Mohamed',
      name: 'profileName',
      desc: '',
      args: [],
    );
  }

  /// `mohamed@gmail.com`
  String get profileEmail {
    return Intl.message(
      'mohamed@gmail.com',
      name: 'profileEmail',
      desc: '',
      args: [],
    );
  }

  /// `My Children`
  String get myChildren {
    return Intl.message(
      'My Children',
      name: 'myChildren',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAll {
    return Intl.message(
      'View all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Latest Notices`
  String get latestNotices {
    return Intl.message(
      'Latest Notices',
      name: 'latestNotices',
      desc: '',
      args: [],
    );
  }

  /// `Time Table`
  String get timeTable {
    return Intl.message(
      'Time Table',
      name: 'timeTable',
      desc: '',
      args: [],
    );
  }

  /// `Teachers`
  String get teachers {
    return Intl.message(
      'Teachers',
      name: 'teachers',
      desc: '',
      args: [],
    );
  }

  /// `Exams`
  String get exams {
    return Intl.message(
      'Exams',
      name: 'exams',
      desc: '',
      args: [],
    );
  }

  /// `Attendance`
  String get attendance {
    return Intl.message(
      'Attendance',
      name: 'attendance',
      desc: '',
      args: [],
    );
  }

  /// `Assignments`
  String get assignments {
    return Intl.message(
      'Assignments',
      name: 'assignments',
      desc: '',
      args: [],
    );
  }

  /// `Tracking`
  String get tracking {
    return Intl.message(
      'Tracking',
      name: 'tracking',
      desc: '',
      args: [],
    );
  }

  /// `Subjects`
  String get subjects {
    return Intl.message(
      'Subjects',
      name: 'subjects',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get results {
    return Intl.message(
      'Results',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Teachers`
  String get menuTeachers {
    return Intl.message(
      'Teachers',
      name: 'menuTeachers',
      desc: '',
      args: [],
    );
  }

  /// `Attendance`
  String get menuAttendance {
    return Intl.message(
      'Attendance',
      name: 'menuAttendance',
      desc: '',
      args: [],
    );
  }

  /// `Assignments`
  String get menuAssignments {
    return Intl.message(
      'Assignments',
      name: 'menuAssignments',
      desc: '',
      args: [],
    );
  }

  /// `Time Table`
  String get menuTimeTable {
    return Intl.message(
      'Time Table',
      name: 'menuTimeTable',
      desc: '',
      args: [],
    );
  }

  /// `Exams`
  String get menuExams {
    return Intl.message(
      'Exams',
      name: 'menuExams',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get menuResults {
    return Intl.message(
      'Results',
      name: 'menuResults',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get subjectScience {
    return Intl.message(
      'Science',
      name: 'subjectScience',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get subjectEnglish {
    return Intl.message(
      'English',
      name: 'subjectEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get subjectArabic {
    return Intl.message(
      'Arabic',
      name: 'subjectArabic',
      desc: '',
      args: [],
    );
  }

  /// `Math`
  String get subjectMath {
    return Intl.message(
      'Math',
      name: 'subjectMath',
      desc: '',
      args: [],
    );
  }

  /// `Drawing`
  String get subjectDrawing {
    return Intl.message(
      'Drawing',
      name: 'subjectDrawing',
      desc: '',
      args: [],
    );
  }

  /// `Computer`
  String get subjectComputer {
    return Intl.message(
      'Computer',
      name: 'subjectComputer',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get subjectAccount {
    return Intl.message(
      'Account',
      name: 'subjectAccount',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get subjectFrench {
    return Intl.message(
      'French',
      name: 'subjectFrench',
      desc: '',
      args: [],
    );
  }

  /// `Offline`
  String get offline {
    return Intl.message(
      'Offline',
      name: 'offline',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Pass`
  String get btnpass {
    return Intl.message(
      'Pass',
      name: 'btnpass',
      desc: '',
      args: [],
    );
  }

  /// `Fail`
  String get btnfail {
    return Intl.message(
      'Fail',
      name: 'btnfail',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
