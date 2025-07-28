import 'package:flutter/foundation.dart';

/// isMobile device (always false on web)
bool get isMobile => false;

/// isDesktop device (always false on web)
bool get isDesktop => false;

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
}) {
  return web;
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
}) {
  return web;
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
  return web;
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
  return web;
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

}) {
  return web ?? orElse;
}

/// Returns `androidValue` if the current platform is Android, otherwise returns `elsePlatform`.
///
/// Example:
/// ```dart
/// String key = androidOrElse('android_key', 'default_key');
/// ```
T androidOrElse<T>(T androidValue, T elsePlatform) {
  return selectOrElse(android: androidValue, orElse: elsePlatform);
}

/// Returns `iosValue` if the current platform is iOS, otherwise returns `elsePlatform`.
///
/// Example:
/// ```dart
/// String key = iosOrElse('ios_key', 'default_key');
/// ```
T iosOrElse<T>(T iosValue, T elsePlatform) {
  return selectOrElse(ios: iosValue, orElse: elsePlatform);
}

/// Returns `fuchsiaValue` if the current platform is Fuchsia, otherwise returns `elsePlatform`.
///
/// Example:
/// ```dart
/// String key = fuchsiaOrElse('fuchsia_key', 'default_key');
/// ```
T fuchsiaOrElse<T>(T fuchsiaValue, T elsePlatform) {
  return selectOrElse(fuchsia: fuchsiaValue, orElse: elsePlatform);
}

/// Returns `linuxValue` if the current platform is Linux, otherwise returns `elsePlatform`.
///
/// Example:
/// ```dart
/// String key = linuxOrElse('linux_key', 'default_key');
/// ```
T linuxOrElse<T>(T linuxValue, T elsePlatform) {
  return selectOrElse(linux: linuxValue, orElse: elsePlatform);
}

/// Returns `macosValue` if the current platform is macOS, otherwise returns `elsePlatform`.
///
/// Example:
/// ```dart
/// String key = macosOrElse('macos_key', 'default_key');
/// ```
T macosOrElse<T>(T macosValue, T elsePlatform) {
  return selectOrElse(macos: macosValue, orElse: elsePlatform);
}

/// Returns `windowsValue` if the current platform is Windows, otherwise returns `elsePlatform`.
///
/// Example:
/// ```dart
/// String key = windowsOrElse('windows_key', 'default_key');
/// ```
T windowsOrElse<T>(T windowsValue, T elsePlatform) {
  return selectOrElse(windows: windowsValue, orElse: elsePlatform);
}

/// Returns `mobileValue` if the current device is mobile, otherwise returns `elsePlatform`.
///
/// Example:
/// ```dart
/// String key = mobileOrElse('mobile_key', 'default_key');
/// ```
T mobileOrElse<T>(T mobileValue, T elsePlatform) {
  return deviceSelector(mobile: mobileValue, desktop: elsePlatform, web: elsePlatform);
}

/// Returns `desktopValue` if the current device is desktop, otherwise returns `elsePlatform`.
///
/// Example:
/// ```dart
/// String key = desktopOrElse('desktop_key', 'default_key');
/// ```
T desktopOrElse<T>(T desktopValue, T elsePlatform) {
  return deviceSelector(mobile: elsePlatform, desktop: desktopValue, web: elsePlatform);
}

/// Returns `webValue` if the current device is web, otherwise returns `elsePlatform`.
///
/// Example:
/// ```dart
/// String key = webOrElse('web_key', 'default_key');
/// ```
T webOrElse<T>(T webValue, T elsePlatform) {
  return deviceSelector(mobile: elsePlatform, desktop: elsePlatform, web: webValue);
}
