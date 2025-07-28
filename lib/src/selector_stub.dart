import 'package:flutter/foundation.dart';

/// isMobile device (stub)
bool get isMobile => throw UnsupportedError('Unsupported platform');

/// isDesktop device (stub)
bool get isDesktop => throw UnsupportedError('Unsupported platform');

/// Selects a value based on the current platform (stub).
///
/// Throws [UnsupportedError] as this is a stub implementation.
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
/// print(message); // Throws UnsupportedError
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
  throw UnsupportedError('Unsupported platform');
}

/// Optional selector for known platforms (stub).
///
/// Throws [UnsupportedError] as this is a stub implementation.
///
/// Example:
/// ```dart
/// String? specialMessage = optionalSelector(
///       android: 'Special message for Android!',
///       ios: 'Special message for iOS!',
/// );
/// print(specialMessage); // Throws UnsupportedError
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
  throw UnsupportedError('Unsupported platform');
}

/// Selects a value based on the device type (stub).
///
/// Throws [UnsupportedError] as this is a stub implementation.
///
/// Example:
/// ```dart
/// String deviceType = deviceSelector(
///       mobile: 'This is a mobile device.',
///       desktop: 'This is a desktop device.',
///       web: 'This is a web browser.',
/// );
/// print(deviceType); // Throws UnsupportedError
/// ```
T deviceSelector<T>({
  required T mobile,
  required T desktop,
  required T web,
  @visibleForTesting
  String? debugDeviceType,
}) {
  throw UnsupportedError('Unsupported platform');
}

/// Optional device selector (stub).
///
/// Throws [UnsupportedError] as this is a stub implementation.
///
/// Example:
/// ```dart
/// String? specificDeviceMessage = optionalDeviceSelector(
///       mobile: 'Mobile specific UI.',
///       web: 'Web specific UI.',
/// );
/// print(specificDeviceMessage); // Throws UnsupportedError
/// ```
T? optionalDeviceSelector<T>({
  T? mobile,
  T? desktop,
  T? web,
  @visibleForTesting
  String? debugDeviceType,
}) {
  throw UnsupportedError('Unsupported platform');
}

/// Selects a value based on the current platform, with a fallback `orElse` value (stub).
///
/// Throws [UnsupportedError] as this is a stub implementation.
///
/// Example:
/// ```dart
/// String apiKey = selectOrElse(
///       android: 'YOUR_ANDROID_API_KEY',
///       ios: 'YOUR_IOS_API_KEY',
///       orElse: 'DEFAULT_API_KEY', // Used if platform is not Android or iOS
/// );
/// print(apiKey); // Throws UnsupportedError
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
  throw UnsupportedError('Unsupported platform');
}

/// Returns `androidValue` if the current platform is Android, otherwise returns `elsePlatform` (stub).
///
/// Throws [UnsupportedError] as this is a stub implementation.
///
/// Example:
/// ```dart
/// String key = androidOrElse('android_key', 'default_key');
/// ```
T androidOrElse<T>(T androidValue, T elsePlatform, {@visibleForTesting String? debugPlatform}) {
  throw UnsupportedError('Unsupported platform');
}

/// Returns `iosValue` if the current platform is iOS, otherwise returns `elsePlatform` (stub).
///
/// Throws [UnsupportedError] as this is a stub implementation.
///
/// Example:
/// ```dart
/// String key = iosOrElse('ios_key', 'default_key');
/// ```
T iosOrElse<T>(T iosValue, T elsePlatform, {@visibleForTesting String? debugPlatform}) {
  throw UnsupportedError('Unsupported platform');
}

/// Returns `fuchsiaValue` if the current platform is Fuchsia, otherwise returns `elsePlatform` (stub).
///
/// Throws [UnsupportedError] as this is a stub implementation.
///
/// Example:
/// ```dart
/// String key = fuchsiaOrElse('fuchsia_key', 'default_key');
/// ```
T fuchsiaOrElse<T>(T fuchsiaValue, T elsePlatform, {@visibleForTesting String? debugPlatform}) {
  throw UnsupportedError('Unsupported platform');
}

/// Returns `linuxValue` if the current platform is Linux, otherwise returns `elsePlatform` (stub).
///
/// Throws [UnsupportedError] as this is a stub implementation.
///
/// Example:
/// ```dart
/// String key = linuxOrElse('linux_key', 'default_key');
/// ```
T linuxOrElse<T>(T linuxValue, T elsePlatform, {@visibleForTesting String? debugPlatform}) {
  throw UnsupportedError('Unsupported platform');
}

/// Returns `macosValue` if the current platform is macOS, otherwise returns `elsePlatform` (stub).
///
/// Throws [UnsupportedError] as this is a stub implementation.
///
/// Example:
/// ```dart
/// String key = macosOrElse('macos_key', 'default_key');
/// ```
T macosOrElse<T>(T macosValue, T elsePlatform, {@visibleForTesting String? debugPlatform}) {
  throw UnsupportedError('Unsupported platform');
}

/// Returns `windowsValue` if the current platform is Windows, otherwise returns `elsePlatform` (stub).
///
/// Throws [UnsupportedError] as this is a stub implementation.
///
/// Example:
/// ```dart
/// String key = windowsOrElse('windows_key', 'default_key');
/// ```
T windowsOrElse<T>(T windowsValue, T elsePlatform, {@visibleForTesting String? debugPlatform}) {
  throw UnsupportedError('Unsupported platform');
}
