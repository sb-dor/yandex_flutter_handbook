import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';

class PronounStyle {
  static const formal = 'formal';

  static const informal = 'informal';
}

class LocalizationApp extends StatefulWidget {
  const LocalizationApp({super.key});

  @override
  State<LocalizationApp> createState() => _LocalizationAppState();
}

class _LocalizationAppState extends State<LocalizationApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('ru'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: _LocalizationHomeWidget(),
    );
  }
}

class _LocalizationHomeWidget extends StatefulWidget {
  const _LocalizationHomeWidget();

  @override
  State<_LocalizationHomeWidget> createState() => _LocalizationHomeWidgetState();
}

class _LocalizationHomeWidgetState extends State<_LocalizationHomeWidget> {
  int _counter = 0;

  void increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
      body: Center(
        child: TextButton(
          onPressed: () {
            increment();
          },
          child: Text(
            AppLocalizations.of(
              context,
            )!.pushCount(_counter, DateTime.now(), PronounStyle.informal),
          ),
        ),
      ),
    );
  }
}
