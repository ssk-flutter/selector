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
        appBar: AppBar(
          title: const Text('platform selector'),
        ),
        body: Column(
          children: [
            Center(child: Text('Running on: ${eachName()}\n')),
            Center(
                child: Text(
                    'function on each platform: ${eachFunction()(1, 2)}\n')),
          ],
        ),
      ),
    );
  }

  eachName() => selector(
        android: 'Android',
        ios: 'iOS',
        windows: 'Windows',
        linux: 'Linux',
        mac: 'MacOS',
        fuchsia: 'Fuchsia',
      );

  eachFunction() => selector(
        android: (a, b) => a + b,
        ios: (a, b) => a * b,
        windows: (a, b) => a / b,
        linux: (a, b) => pow(a, b),
        mac: (a, b) => sqrt(a) * b,
        fuchsia: (a, b) => a - b,
      );
}
