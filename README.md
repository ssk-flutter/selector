# selector

Platform Selector

## Basic selector
- with `if`
```dart
String result = '';
if (Platform.isAndroid) result = 'hello Android';
if (Platform.isIOS) result = 'hello iOS';
if (Platform.isFuchsia) result = 'hello  Fuchsia';
if (Platform.isLinux) result = 'hello  Linux';
if (Platform.isMacOS) result = 'hello MacOS';
if (Platform.isWindows) result = 'hello  Windows';
```

- with `selector`
```dart
String result = selector(
      android: 'hello Android',
      ios: 'hello iOS',
      fuchsia: 'hello Fuchsia',
      linux: 'hello Linux',
      mac: 'hello MacOS',
      windows: 'hello Windows',
);
```

## OrElse selector
- with `if`
```dart
String admobKey;
if (Platform.isAndroid) admobKey = 'android-key';
else admobKey = 'iOS-key';
```

- with `selector`
```dart
String admobKey = androidOrElse('android-key', 'iOS-key');
```