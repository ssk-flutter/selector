import 'dart:io';

import 'package:flutter/foundation.dart';

/// isMobile device
bool get isMobile => Platform.isAndroid || Platform.isFuchsia || Platform.isIOS;

/// isDesktop device
bool get isDesktop =>
    Platform.isWindows || Platform.isLinux || Platform.isMacOS;

/// Selects a value based on the current platform.
///
/// All platform parameters are required. Throws [UnsupportedError] if the
/// platform is not identified.
///
/// Example:
/// ```dart
/// String message = selector(
///       web: 'Hello Web!',
///       android: 'Hello Android!',
///       ios: 'Hello iOS!',
///       fuchsia: 'Hello Fuchsia!',
///       linux: 'Hello Linux!',
///       macos: 'Hello macOS!',
///       windows: 'Hello Windows!',
/// );
/// print(message); // e.g., "Hello Android!" on an Android device
/// ```
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

/// Optional selector for known platforms.
///
/// Returns a value based on the current platform. Platform parameters are
/// optional. Returns `null` if the current platform's value is not provided
/// or if the platform is unidentified.
///
/// Example:
/// ```dart
/// String? specialMessage = optionalSelector(
///       android: 'Special message for Android!',
///       ios: 'Special message for iOS!',
/// );
/// print(specialMessage); // "Special message for Android!" on Android, null on macOS
/// ```
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

/// Selects a value based on the device type (mobile, desktop, web).
///
/// All device type parameters are required. Throws [UnsupportedError] if the
/// device type is not identified.
///
/// Example:
/// ```dart
/// String deviceType = deviceSelector(
///       mobile: 'This is a mobile device.',
///       desktop: 'This is a desktop device.',
///       web: 'This is a web browser.',
/// );
/// print(deviceType); // e.g., "This is a mobile device." on an iOS phone
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

/// Optional device selector.
///
/// Similar to [deviceSelector], but device type parameters are optional.
/// Returns `null` if the current device type's value is not provided or if
/// the device type is unidentified.
///
/// Example:
/// ```dart
/// String? specificDeviceMessage = optionalDeviceSelector(
///       mobile: 'Mobile specific UI.',
///       web: 'Web specific UI.',
/// );
/// print(specificDeviceMessage); // "Mobile specific UI." on Android, null on Windows desktop
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

/// Selects a value based on the current platform, with a fallback `orElse` value.
///
/// Use this when you want to provide a default fallback value if a specific
/// platform's value is not defined.
///
/// Example:
/// ```dart
/// String apiKey = selectOrElse(
///       android: 'YOUR_ANDROID_API_KEY',
///       ios: 'YOUR_IOS_API_KEY',
///       orElse: 'DEFAULT_API_KEY', // Used if platform is not Android or iOS
/// );
/// print(apiKey); // "YOUR_ANDROID_API_KEY" on Android, "DEFAULT_API_KEY" on Windows
/// ```
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
