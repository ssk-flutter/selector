import 'dart:math';

import 'package:flutter/material.dart';
import 'package:selector/selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('platform selector')),
        body: Builder(builder: (context) => _buildBody(context)),
      ),
    );
  }

  _buildBody(BuildContext context) => Column(
        children: [
          TextButton(
            onPressed: () => _showSnackBar(context, _selector()),
            child: const Text('selector'),
          ),
          TextButton(
            onPressed: () => _showSnackBar(context, _deviceSelector()),
            child: const Text('deviceSelector'),
          ),
          TextButton(
            onPressed: () =>
                _showSnackBar(context, _functionParameter().toString()),
            child: const Text('parameter as function'),
          ),
          TextButton(
            onPressed: () => _showSnackBar(context, _androidOrElse()),
            child: const Text('androidOrElse'),
          ),
          TextButton(
            onPressed: () => _showSnackBar(context, _iosOrElse()),
            child: const Text('iosOrElse()'),
          ),
          TextButton(
            onPressed: () => _showSnackBar(context, _mobileOrElse()),
            child: const Text('mobileOrElse()'),
          ),
          TextButton(
            onPressed: () => _showSnackBar(context, _desktopOrElse()),
            child: const Text('desktopOrElse()'),
          ),
          TextButton(
            onPressed: () => _showSnackBar(context, _webOrElse()),
            child: const Text('webOrElse()'),
          ),
        ],
      );

  _showSnackBar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));

  String _selector() => selector<String>(
        android: 'hello Android',
        ios: 'hello iOS',
        fuchsia: 'hello Fuchsia',
        linux: 'hello Linux',
        macos: 'hello MacOS',
        windows: 'hello Windows',
        web: 'hello Web',
      );

  _deviceSelector() => deviceSelector<String>(
        mobile: 'hello Mobile',
        desktop: 'hello Desktop',
        web: 'hello Web',
      );

  _functionParameter() => selector<Function(num, num)>(
        android: (a, b) => a + b,
        ios: (a, b) => a * b,
        windows: (a, b) => a / b,
        linux: (a, b) => pow(a, b),
        macos: (a, b) => sqrt(a) * b,
        fuchsia: (a, b) => a - b,
        web: (a, b) => a % b,
      )(1, 2);

  _androidOrElse() => androidOrElse<String>('android-admob-id', 'ios-admob-id');

  _iosOrElse() => iosOrElse<String>('ios-admob-id', 'android-admob-id');

  _mobileOrElse() =>
      mobileOrElse<String>('mobile-admob-id', 'desktop-admob-id');

  _desktopOrElse() =>
      desktopOrElse<String>('desktop-admob-id', 'mobile-admob-id');

  _webOrElse() => webOrElse<String>('web-admob-id', 'non-web-admob-id');
}
