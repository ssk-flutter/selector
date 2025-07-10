import 'dart:io';

import 'package:flutter/foundation.dart';

/// isMobile device
bool get isMobile => Platform.isAndroid || Platform.isFuchsia || Platform.isIOS;

/// isDesktop device
bool get isDesktop =>
    Platform.isWindows || Platform.isLinux || Platform.isMacOS;

/// selector for known platforms
/// selector for known platforms
T selector<T>({
  required T web,
  required T android,
  required T ios,
  required T macos,
  required T fuchsia,
  required T linux,
  required T windows,
  @visibleForTesting
  String? debugPlatform,
}) {
  final platform = debugPlatform ?? (kIsWeb ? 'web' : Platform.operatingSystem);

  switch (platform) {
    case 'web':
      return web;
    case 'android':
      return android;
    case 'ios':
      return ios;
    case 'fuchsia':
      return fuchsia;
    case 'linux':
      return linux;
    case 'macos':
      return macos;
    case 'windows':
      return windows;
  }

  throw UnsupportedError('Unidentified platform $platform');
}

/// optional selector for known platforms
T? optionalSelector<T>({
  T? web,
  T? android,
  T? ios,
  T? macos,
  T? fuchsia,
  T? linux,
  T? windows,
  @visibleForTesting
  String? debugPlatform,
}) {
  final platform = debugPlatform ?? (kIsWeb ? 'web' : Platform.operatingSystem);

  switch (platform) {
    case 'web':
      return web;
    case 'android':
      return android;
    case 'ios':
      return ios;
    case 'fuchsia':
      return fuchsia;
    case 'linux':
      return linux;
    case 'macos':
      return macos;
    case 'windows':
      return windows;
  }
  return null;
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
  required T mobile,
  required T desktop,
  required T web,
  @visibleForTesting
  String? debugDeviceType,
}) {
  final deviceType = debugDeviceType ??
      (kIsWeb
          ? 'web'
          : (isMobile
              ? 'mobile'
              : (isDesktop ? 'desktop' : Platform.operatingSystem)));

  switch (deviceType) {
    case 'web':
      return web;
    case 'mobile':
      return mobile;
    case 'desktop':
      return desktop;
  }

  throw UnsupportedError('Unidentified device $deviceType');
}

/// optional deviceSelector
///
/// ```dart
/// String result = deviceSelector(
///   mobile: 'hello Mobile',
///   desktop: 'hello Desktop',
///   web: 'hello Web'
/// );
/// ```
T? optionalDeviceSelector<T>({
  T? mobile,
  T? desktop,
  T? web,
  @visibleForTesting
  String? debugDeviceType,
}) {
  final deviceType = debugDeviceType ??
      (kIsWeb
          ? 'web'
          : (isMobile
              ? 'mobile'
              : (isDesktop ? 'desktop' : Platform.operatingSystem)));

  switch (deviceType) {
    case 'web':
      return web;
    case 'mobile':
      return mobile;
    case 'desktop':
      return desktop;
  }

  throw UnsupportedError('Unidentified device $deviceType');
}

T macosOrElse<T>(T macos, T elsePlatform) {
  if (Platform.isMacOS) return macos;
  return elsePlatform;
}

T mobileOrElse<T>(T mobile, T elsePlatform) {
  if (isMobile) return mobile;

  return elsePlatform;
}

T desktopOrElse<T>(T desktop, T elsePlatform) {
  if (isDesktop) return desktop;

  return elsePlatform;
}

T webOrElse<T>(T web, T elsePlatform) {
  if (kIsWeb) return web;

  return elsePlatform;
}

/// selector with orElse for known platforms
T selectOrElse<T>({
  T? web,
  T? android,
  T? ios,
  T? macos,
  T? fuchsia,
  T? linux,
  T? windows,
  required T orElse,
  @visibleForTesting
  String? debugPlatform,
}) {
  final platform = debugPlatform ?? (kIsWeb ? 'web' : Platform.operatingSystem);

  switch (platform) {
    case 'web':
      return web ?? orElse;
    case 'android':
      return android ?? orElse;
    case 'ios':
      return ios ?? orElse;
    case 'fuchsia':
      return fuchsia ?? orElse;
    case 'linux':
      return linux ?? orElse;
    case 'macos':
      return macos ?? orElse;
    case 'windows':
      return windows ?? orElse;
  }

  return orElse;
}
