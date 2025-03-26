import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
  ];

  /// No description provided for @appTitle.
  ///
  /// In zh, this message translates to:
  /// **'RankHub'**
  String get appTitle;

  /// No description provided for @ok.
  ///
  /// In zh, this message translates to:
  /// **'确定'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get cancel;

  /// No description provided for @yes.
  ///
  /// In zh, this message translates to:
  /// **'是'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In zh, this message translates to:
  /// **'否'**
  String get no;

  /// No description provided for @close.
  ///
  /// In zh, this message translates to:
  /// **'关闭'**
  String get close;

  /// No description provided for @save.
  ///
  /// In zh, this message translates to:
  /// **'保存'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In zh, this message translates to:
  /// **'删除'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In zh, this message translates to:
  /// **'编辑'**
  String get edit;

  /// No description provided for @add.
  ///
  /// In zh, this message translates to:
  /// **'添加'**
  String get add;

  /// No description provided for @search.
  ///
  /// In zh, this message translates to:
  /// **'搜索'**
  String get search;

  /// No description provided for @refresh.
  ///
  /// In zh, this message translates to:
  /// **'刷新'**
  String get refresh;

  /// No description provided for @upload_time.
  ///
  /// In zh, this message translates to:
  /// **'上传时间'**
  String get upload_time;

  /// No description provided for @mai_level_value.
  ///
  /// In zh, this message translates to:
  /// **'谱面定数'**
  String get mai_level_value;

  /// No description provided for @mai_level_index.
  ///
  /// In zh, this message translates to:
  /// **'难度'**
  String get mai_level_index;

  /// No description provided for @mai_fc_type.
  ///
  /// In zh, this message translates to:
  /// **'FC 类型'**
  String get mai_fc_type;

  /// No description provided for @mai_fs_type.
  ///
  /// In zh, this message translates to:
  /// **'FS 类型'**
  String get mai_fs_type;

  /// No description provided for @mai_version.
  ///
  /// In zh, this message translates to:
  /// **'版本'**
  String get mai_version;

  /// No description provided for @mai_genre.
  ///
  /// In zh, this message translates to:
  /// **'流派'**
  String get mai_genre;

  /// No description provided for @mai_song_type.
  ///
  /// In zh, this message translates to:
  /// **'谱面类型'**
  String get mai_song_type;

  /// No description provided for @lx_search_song.
  ///
  /// In zh, this message translates to:
  /// **'搜索谱面'**
  String get lx_search_song;

  /// No description provided for @lx_search_hint.
  ///
  /// In zh, this message translates to:
  /// **'支持 ID, 曲名, 艺术家, 别名 查找'**
  String get lx_search_hint;

  /// No description provided for @reset_filter.
  ///
  /// In zh, this message translates to:
  /// **'重置筛选'**
  String get reset_filter;

  /// No description provided for @select_level_value_range_dialog_title.
  ///
  /// In zh, this message translates to:
  /// **'选择谱面定数范围'**
  String get select_level_value_range_dialog_title;

  /// No description provided for @current_range.
  ///
  /// In zh, this message translates to:
  /// **'当前范围'**
  String get current_range;

  /// No description provided for @mai_selet_level_index_dialog_title.
  ///
  /// In zh, this message translates to:
  /// **'选择谱面难度'**
  String get mai_selet_level_index_dialog_title;

  /// No description provided for @mai_select_fc_type_dialog_title.
  ///
  /// In zh, this message translates to:
  /// **'选择 FC 类型'**
  String get mai_select_fc_type_dialog_title;

  /// No description provided for @mai_select_fs_type_dialog_title.
  ///
  /// In zh, this message translates to:
  /// **'选择 FS 类型'**
  String get mai_select_fs_type_dialog_title;

  /// No description provided for @mai_select_version_dialog_title.
  ///
  /// In zh, this message translates to:
  /// **'选择版本'**
  String get mai_select_version_dialog_title;

  /// No description provided for @mai_select_genre_dialog_title.
  ///
  /// In zh, this message translates to:
  /// **'选择流派'**
  String get mai_select_genre_dialog_title;

  /// No description provided for @mai_select_song_type_dialog_title.
  ///
  /// In zh, this message translates to:
  /// **'选择谱面类型'**
  String get mai_select_song_type_dialog_title;

  /// No description provided for @mai_dx.
  ///
  /// In zh, this message translates to:
  /// **'DX'**
  String get mai_dx;

  /// No description provided for @mai_standard.
  ///
  /// In zh, this message translates to:
  /// **'标准'**
  String get mai_standard;

  /// No description provided for @mai_basic.
  ///
  /// In zh, this message translates to:
  /// **'BASIC'**
  String get mai_basic;

  /// No description provided for @mai_advanced.
  ///
  /// In zh, this message translates to:
  /// **'ADVANCED'**
  String get mai_advanced;

  /// No description provided for @mai_expert.
  ///
  /// In zh, this message translates to:
  /// **'EXPERT'**
  String get mai_expert;

  /// No description provided for @mai_master.
  ///
  /// In zh, this message translates to:
  /// **'MASTER'**
  String get mai_master;

  /// No description provided for @mai_remaster.
  ///
  /// In zh, this message translates to:
  /// **'Re:MASTER'**
  String get mai_remaster;

  /// No description provided for @mai_dx_score.
  ///
  /// In zh, this message translates to:
  /// **'DX 分数'**
  String get mai_dx_score;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh': {
  switch (locale.scriptCode) {
    case 'Hant': return AppLocalizationsZhHant();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
