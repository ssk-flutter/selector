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
          FlatButton(
              child: Text('selector'),
              onPressed: () => _showSnackBar(context, _selector())),
          FlatButton(
              child: Text('deviceSelector'),
              onPressed: () => _showSnackBar(context, _deviceSelector())),
          FlatButton(
              child: Text('parameter as function'),
              onPressed: () =>
                  _showSnackBar(context, _functionParameter().toString())),
          FlatButton(
              child: Text('androidOrElse'),
              onPressed: () => _showSnackBar(context, _androidOrElse())),
          FlatButton(
              child: Text('iosOrElse()'),
              onPressed: () => _showSnackBar(context, _iosOrElse())),
        ],
      );

  _showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));

  _selector() => selector(
      android: 'hello Android',
      ios: 'hello iOS',
      fuchsia: 'hello Fuchsia',
      linux: 'hello Linux',
      mac: 'hello MacOS',
      windows: 'hello Windows');

  _deviceSelector() => deviceSelector(
      mobile: 'hello Mobile',
      desktop: 'hello Desktop',
      web: 'hello Web');

  _functionParameter() => selector(
        android: (a, b) => a + b,
        ios: (a, b) => a * b,
        windows: (a, b) => a / b,
        linux: (a, b) => pow(a, b),
        mac: (a, b) => sqrt(a) * b,
        fuchsia: (a, b) => a - b,
      )(1, 2);

  _androidOrElse() => androidOrElse('android-admob-id', 'ios-admob-id');

  _iosOrElse() => iosOrElse('ios-admob-id', 'android-admob-id');
}
