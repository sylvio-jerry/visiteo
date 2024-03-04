import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/themes/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Visiteo",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr', 'FR'), // Français
        // Ajoutez d'autres locales si nécessaire
      ],
    ),
  );
}
