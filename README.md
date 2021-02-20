- [Selector](#selector)
  - [Basic selector](#basic-selector)
  - [Device selector](#device-selector)
  - [OrElse selector](#orelse-selector)
  - [Query](#query)
# Selector

Multi type support Platform Selector

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

## Device selector
- with `if`
```dart
String result = '';
if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia)
  result = 'hello Mobile';
if (Platform.isLinux || Platform.isMacOS || Platform.isWindows)
  result = 'hello Desktop';
if (kIsWeb) result = 'hello Web';
```

- with `deviceSelector`
```dart
String result = deviceSelector(
      mobile: 'hello Mobile',
      desktop: 'hello Desktop',
      web: 'hello Web',
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

## Query
```dart
print('isDesktop: $isDesktop')
print('isMobile: $isMobile')
```
