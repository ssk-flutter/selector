- [Selector](#selector)
  - [Basic selector](#basic-selector)
  - [Device selector](#device-selector)
  - [OrElse selector](#orelse-selector)
  - [Query](#query)
# Selector

Multi type support Platform Selector

## Basic selector
- with `selector`
```dart
String result = selector(
      web: 'hello Web',
      android: 'hello Android',
      ios: 'hello iOS',
      fuchsia: 'hello Fuchsia',
      linux: 'hello Linux',
      macos: 'hello MacOS',
      windows: 'hello Windows',
);
```

## optional selector
- with `selector`
```dart
String? result = optionalSelector(
      android: 'hello Android',
      ios: 'hello iOS',
      fuchsia: 'hello Fuchsia',
);
```

## Device selector
```dart
String result = deviceSelector(
      mobile: 'hello Mobile',
      desktop: 'hello Desktop',
      web: 'hello Web',
);
```

## OrElse selector
```dart
String admobKey = selectOrElse(
      android: 'android-key',
      orElse: 'ios-key',
);
String iosPreferredKey = selectOrElse(
      ios: 'ios-key',
      orElse: 'android-key',
);
```

## Query
```dart
print('isDesktop: $isDesktop')
print('isMobile: $isMobile')
```
