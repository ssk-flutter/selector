# selector

Platform Selector

## Basic selector
- with `if`
```dart
String result = '';
if (Platform.isAndroid) result = 'android';
if (Platform.isIOS) result = 'ios';
if (Platform.isFuchsia) result = 'fuchsia';
if (Platform.isLinux) result = 'linux';
if (Platform.isMacOS) result = 'mac';
if (Platform.isWindows) result = 'windows';
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