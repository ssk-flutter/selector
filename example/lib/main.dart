import 'dart:math';

import 'package:flutter/material.dart';
import 'package:selector/selector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('platform selector')),
        body: Builder(builder: (context) => _buildBody(context)),
      ),
    );
  }

  _buildBody(BuildContext context) => Column(
        children: [
          TextButton(child: Text('selector'), onPressed: () => _showSnackBar(context, _selector())),
          TextButton(child: Text('deviceSelector'), onPressed: () => _showSnackBar(context, _deviceSelector())),
          TextButton(
              child: Text('parameter as function'),
              onPressed: () => _showSnackBar(context, _functionParameter().toString())),
          TextButton(child: Text('androidOrElse'), onPressed: () => _showSnackBar(context, _androidOrElse())),
          TextButton(child: Text('iosOrElse()'), onPressed: () => _showSnackBar(context, _iosOrElse())),
        ],
      );

  _showSnackBar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

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
}
