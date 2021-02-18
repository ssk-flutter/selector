import 'dart:io';

import 'package:flutter/foundation.dart';

T selector<T>({
  T android,
  T ios,
  T mac,
  T fuchsia,
  T linux,
  T windows,
}) {
  if (Platform.isAndroid) return android;
  if (Platform.isIOS) return ios;
  if (Platform.isFuchsia) return fuchsia;
  if (Platform.isLinux) return linux;
  if (Platform.isMacOS) return mac;
  if (Platform.isWindows) return windows;

  throw 'Unidentified platform ${Platform.operatingSystem}';
}

/// deviceSelector
///
/// ```dart
/// String result = deviceSelector(
///   mobile: 'hello Mobile',
///   desktop: 'hello Desktop',
///   web: 'hello Web'
/// );
/// ```
T deviceSelector<T>({
  T mobile,
  T desktop,
  T web,
}) {
  if (kIsWeb)
    return web;

  if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia)
    return mobile;

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
    return desktop;

  throw 'Unidentified device ${Platform.operatingSystem}';
}

T androidOrElse<T>(T android, T elsePlatform) {
  if (Platform.isAndroid) return android;
  return elsePlatform;
}

T iosOrElse<T>(T ios, T elsePlatform) {
  if (Platform.isIOS) return ios;
  return elsePlatform;
}

T fuchsiaOrElse<T>(T fuchsia, T elsePlatform) {
  if (Platform.isFuchsia) return fuchsia;
  return elsePlatform;
}

T linuxOrElse<T>(T linux, T elsePlatform) {
  if (Platform.isLinux) return linux;
  return elsePlatform;
}

T macOrElse<T>(T mac, T elsePlatform) {
  if (Platform.isMacOS) return mac;
  return elsePlatform;
}

T windowsOrElse<T>(T windows, T elsePlatform) {
  if (Platform.isWindows) return windows;
  return elsePlatform;
}

T mobileOrElse<T>(T mobile, T elsePlatform) {
  if (Platform.isAndroid || Platform.isFuchsia || Platform.isIOS)
    return mobile;

  return elsePlatform;
}

T desktopOrElse<T>(T desktop, T elsePlatform) {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
    return desktop;

  return elsePlatform;
}

T webOrElse<T>(T web, T elsePlatform) {
  if (kIsWeb)
    return web;

  return elsePlatform;
}