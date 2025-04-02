import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/l10n/app_localizations.dart';
import 'package:rank_hub/src/pages/add_player_screen.dart';
import 'package:rank_hub/src/core/screens/main_screen.dart';

final navigatorKeyProvider = Provider((ref) => GlobalKey<NavigatorState>());

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorKey = ref.watch(navigatorKeyProvider);
    return MaterialApp(
        navigatorKey: navigatorKey,
        initialRoute: '/',
        routes: {
          "/": (context) => MainScreen(),
          "add_player_data": (context) => AddPlayerScreen(),
        },

        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,

        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('zh', ''),
          Locale('zh-Hant', ''),
        ],
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark);
  }
}
