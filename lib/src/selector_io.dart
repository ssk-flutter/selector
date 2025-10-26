import 'package:flutter/foundation.dart';

import 'selector_overrides.dart';

export 'selector_overrides.dart'
    show debugTargetPlatformOverride, debugIsWebOverride;

bool get _isWeb => debugIsWebOverride ?? kIsWeb;

TargetPlatform get _targetPlatform =>
    debugTargetPlatformOverride ?? defaultTargetPlatform;

String _platformLabel() {
  if (_isWeb) {
    return 'web';
  }
  final description = _targetPlatform.toString();
  final dotIndex = description.indexOf('.');
  return dotIndex == -1 ? description : description.substring(dotIndex + 1);
}

bool get isMobile {
  if (_isWeb) {
    return false;
  }
  switch (_targetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.iOS:
      return true;
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
    case TargetPlatform.linux:
      return false;
  }
}

bool get isDesktop {
  if (_isWeb) {
    return false;
  }
  switch (_targetPlatform) {
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
    case TargetPlatform.linux:
      return true;
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.iOS:
      return false;
  }
}

String _resolveDeviceType({String? debugDeviceType}) {
  if (debugDeviceType != null) {
    return debugDeviceType;
  }
  if (_isWeb) {
    return 'web';
  }
  if (isMobile) {
    return 'mobile';
  }
  if (isDesktop) {
    return 'desktop';
  }
  return _platformLabel();
}

T selector<T>({
  required T web,
  required T android,
  required T ios,
  required T macos,
  required T fuchsia,
  required T linux,
  required T windows,
}) {
  if (_isWeb) {
    return web;
  }

  final mapping = <TargetPlatform, T>{
    TargetPlatform.android: android,
    TargetPlatform.iOS: ios,
    TargetPlatform.fuchsia: fuchsia,
    TargetPlatform.macOS: macos,
    TargetPlatform.windows: windows,
    TargetPlatform.linux: linux,
  };

  final result = mapping[_targetPlatform];
  if (result != null) {
    return result;
  }

  throw UnsupportedError('Unidentified platform ${_platformLabel()}');
}

T? optionalSelector<T>({
  T? web,
  T? android,
  T? ios,
  T? macos,
  T? fuchsia,
  T? linux,
  T? windows,
}) {
  if (_isWeb) {
    return web;
  }

  final mapping = <TargetPlatform, T?>{
    TargetPlatform.android: android,
    TargetPlatform.iOS: ios,
    TargetPlatform.fuchsia: fuchsia,
    TargetPlatform.macOS: macos,
    TargetPlatform.windows: windows,
    TargetPlatform.linux: linux,
  };

  return mapping[_targetPlatform];
}

T deviceSelector<T>({
  required T mobile,
  required T desktop,
  required T web,
  @visibleForTesting String? debugDeviceType,
}) {
  final deviceType = _resolveDeviceType(debugDeviceType: debugDeviceType);

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

T? optionalDeviceSelector<T>({
  T? mobile,
  T? desktop,
  T? web,
  @visibleForTesting String? debugDeviceType,
}) {
  final deviceType = _resolveDeviceType(debugDeviceType: debugDeviceType);

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
  if (_isWeb) {
    return web ?? orElse;
  }

  final mapping = <TargetPlatform, T?>{
    TargetPlatform.android: android,
    TargetPlatform.iOS: ios,
    TargetPlatform.fuchsia: fuchsia,
    TargetPlatform.macOS: macos,
    TargetPlatform.windows: windows,
    TargetPlatform.linux: linux,
  };

  return mapping[_targetPlatform] ?? orElse;
}

T androidOrElse<T>(T androidValue, T elsePlatform) {
  return selectOrElse(android: androidValue, orElse: elsePlatform);
}

T iosOrElse<T>(T iosValue, T elsePlatform) {
  return selectOrElse(ios: iosValue, orElse: elsePlatform);
}

T fuchsiaOrElse<T>(T fuchsiaValue, T elsePlatform) {
  return selectOrElse(fuchsia: fuchsiaValue, orElse: elsePlatform);
}

T linuxOrElse<T>(T linuxValue, T elsePlatform) {
  return selectOrElse(linux: linuxValue, orElse: elsePlatform);
}

T macosOrElse<T>(T macosValue, T elsePlatform) {
  return selectOrElse(macos: macosValue, orElse: elsePlatform);
}

T windowsOrElse<T>(T windowsValue, T elsePlatform) {
  return selectOrElse(windows: windowsValue, orElse: elsePlatform);
}

T mobileOrElse<T>(T mobileValue, T elsePlatform) {
  return deviceSelector(
      mobile: mobileValue, desktop: elsePlatform, web: elsePlatform);
}

T desktopOrElse<T>(T desktopValue, T elsePlatform) {
  return deviceSelector(
      mobile: elsePlatform, desktop: desktopValue, web: elsePlatform);
}

T webOrElse<T>(T webValue, T elsePlatform) {
  return deviceSelector(
      mobile: elsePlatform, desktop: elsePlatform, web: webValue);
}
