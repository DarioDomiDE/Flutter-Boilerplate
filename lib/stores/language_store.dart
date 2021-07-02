// import 'package:boilerplate/data/repository.dart';
// import 'package:boilerplate/models/language/Language.dart';
// import 'package:boilerplate/stores/error/error_store.dart';
import '../data/repository.dart';
import '../models/Language.dart';
import 'store.dart';
// import 'package:mobx/mobx.dart';

class LanguageStore = _LanguageStore with Store;

abstract class _LanguageStore with Store {
  static const String TAG = "LanguageStore";

  // repository instance
  final Repository repository;

  // store for handling errors
  // final ErrorStore errorStore = ErrorStore();

  // supported languages
  List<Language> supportedLanguages = [
    Language(code: 'US', locale: 'en', language: 'English'),
    Language(code: 'DE', locale: 'de', language: 'Deutsch'),
  ];

  // constructor:---------------------------------------------------------------
  _LanguageStore(Repository repository) : this.repository = repository {
    // init();
  }

  // store variables:-----------------------------------------------------------
  String _locale = "en";

  String get locale => _locale;

  // actions:-------------------------------------------------------------------
  void changeLanguage(String value) {
    _locale = value;
    // repository.changeLanguage(value);
  }

  String getCode() {
    switch (_locale) {
      case 'en':
        return 'US';
      case 'de':
        return 'DE';
      default:
        return '';
    }
  }

  String? getLanguage() {
    return supportedLanguages[supportedLanguages
            .indexWhere((language) => language.locale == _locale)]
        .language;
  }

  // general:-------------------------------------------------------------------
  // void init() async {
  // if (repository.currentLanguage != null) {
  //   _locale = repository.currentLanguage!;
  // }
  // }
}
