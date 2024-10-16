import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_l10n/screens/homescreen.dart';
import 'package:i18n_l10n/l10n/l10n.dart';
import 'package:i18n_l10n/streams/general_stream.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    GeneralStream.languageStream.add(const Locale('en'));
    super.initState();
  }

  @override
  void dispose() {
    GeneralStream.languageStream.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Locale>(
      stream: GeneralStream.languageStream.stream,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Flutter Localization & i18n demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MyHomePage(selectLocal: snapshot.data ?? const Locale('en')),
          supportedLocales: L10n.locals,
          locale: snapshot.data,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
        );
      },
    );
  }
}
