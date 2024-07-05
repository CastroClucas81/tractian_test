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

  /// `There are no registered companies`
  String get noCompaniesAvailable {
    return Intl.message(
      'There are no registered companies',
      name: 'noCompaniesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred when listing Companies`
  String get AnErrorOccurredWhenListCompanies {
    return Intl.message(
      'An error occurred when listing Companies',
      name: 'AnErrorOccurredWhenListCompanies',
      desc: '',
      args: [],
    );
  }

  /// `Assets`
  String get assets {
    return Intl.message(
      'Assets',
      name: 'assets',
      desc: '',
      args: [],
    );
  }

  /// `Search Asset or Location`
  String get searchActiveOrLocal {
    return Intl.message(
      'Search Asset or Location',
      name: 'searchActiveOrLocal',
      desc: '',
      args: [],
    );
  }

  /// `Energy Sensor`
  String get energySensor {
    return Intl.message(
      'Energy Sensor',
      name: 'energySensor',
      desc: '',
      args: [],
    );
  }

  /// `Critic`
  String get critic {
    return Intl.message(
      'Critic',
      name: 'critic',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred when listing Assets`
  String get anErrorOccurredWhenListAssets {
    return Intl.message(
      'An error occurred when listing Assets',
      name: 'anErrorOccurredWhenListAssets',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get noResults {
    return Intl.message(
      'No results',
      name: 'noResults',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
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
