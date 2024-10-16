import 'package:flutter/material.dart';
import 'package:i18n_l10n/extensions/context_extension.dart';
import 'package:i18n_l10n/l10n/l10n.dart';
import 'package:i18n_l10n/streams/general_stream.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.selectLocal});

  final Locale selectLocal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(context.localizations.language),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                context.localizations.helloWorld,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                context.localizations.twoLanguages,
              ),
              ElevatedButton(
                onPressed: () async {
                  GeneralStream.languageStream.add(
                    L10n.locals
                        .firstWhere((element) => element != selectLocal),
                  );
                },
                child: Text(context.localizations.changeLanguage),
              )
            ]),
      ),
    );
  }
}
