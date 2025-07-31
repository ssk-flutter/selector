# Selector

Multi-type support Platform Selector for Flutter. This library helps you write platform-specific code in a clean and functional way.

## Features

-   **Basic Selector (`selector`)**: Choose a value based on the current platform (Android, iOS, macOS, Windows, Linux, Fuchsia, Web). All platform parameters are required. Throws `UnsupportedError` if the platform is not identified.
-   **Optional Selector (`optionalSelector`)**: Similar to `selector`, but platform parameters are optional. Returns `null` if the current platform's value is not provided or if the platform is unidentified.
-   **Device Selector (`deviceSelector`)**: Select a value based on device type (mobile, desktop, web). All device type parameters are required. Throws `UnsupportedError` if the device type is not identified.
-   **Optional Device Selector (`optionalDeviceSelector`)**: Similar to `deviceSelector`, but device type parameters are optional. Returns `null` if the current device type's value is not provided or if the device type is unidentified.
-   **OrElse Selector (`selectOrElse`)**: Provides a fallback `orElse` value if the current platform's value is not provided.
-   **Query (`isMobile`, `isDesktop`)**: Convenient getters to check if the current device is mobile or desktop.

## Usage

### Basic selector (`selector`)

Use `selector` when you need to provide a value for every supported platform.

```dart
import 'package:selector/selector.dart';

String message = selector(
      web: 'Hello Web!',
      android: 'Hello Android!',
      ios: 'Hello iOS!',
      fuchsia: 'Hello Fuchsia!',
      linux: 'Hello Linux!',
      macos: 'Hello macOS!',
      windows: 'Hello Windows!',
);
print(message); // e.g., "Hello Android!" on an Android device
```

### Optional selector (`optionalSelector`)

Use `optionalSelector` when you only need to provide values for a subset of platforms. If the current platform's value is not provided, it returns `null`.

```dart
import 'package:selector/selector.dart';

String? specialMessage = optionalSelector(
      android: 'Special message for Android!',
      ios: 'Special message for iOS!',
);
print(specialMessage); // "Special message for Android!" on Android, null on macOS
```

### Device selector (`deviceSelector`)

Use `deviceSelector` to differentiate between mobile, desktop, and web environments.

```dart
import 'package:selector/selector.dart';

String deviceType = deviceSelector(
      mobile: 'This is a mobile device.',
      desktop: 'This is a desktop device.',
      web: 'This is a web browser.',
);
print(deviceType); // e.g., "This is a mobile device." on an iOS phone
```

### Optional Device selector (`optionalDeviceSelector`)

Similar to `deviceSelector`, but device type parameters are optional. Returns `null` if the current device type's value is not provided.

```dart
import 'package:selector/selector.dart';

String? specificDeviceMessage = optionalDeviceSelector(
      mobile: 'Mobile specific UI.',
      web: 'Web specific UI.',
);
print(specificDeviceMessage); // "Mobile specific UI." on Android, null on Windows desktop
```

### OrElse selector (`androidOrElse`, `iosOrElse`, etc.)

Use these platform-specific `orElse` functions for direct, explicit choices.

```dart
import 'package:selector/selector.dart';

String admobKey = androidOrElse('android-key', 'iOS-key');
String iosPreferredKey = iosOrElse('iOS-key', 'android-key');
String mobileSpecific = mobileOrElse('mobile_value', 'default_value');
String desktopSpecific = desktopOrElse('desktop_value', 'default_value');
String webSpecific = webOrElse('web_value', 'default_value');
```

Alternatively, use the more flexible `selectOrElse` for multiple platform options:

```dart
import 'package:selector/selector.dart

String apiKey = selectOrElse(
      android: 'YOUR_ANDROID_API_KEY',
      ios: 'YOUR_IOS_API_KEY',
      orElse: 'DEFAULT_API_KEY', // Used if platform is not Android or iOS
);
print(apiKey); // "YOUR_ANDROID_API_KEY" on Android, "DEFAULT_API_KEY" on Windows
```

### Query

Convenient getters to check the device type.

```dart
import 'package:selector/selector.dart';

print('isDesktop: $isDesktop'); // true if on Windows, Linux, macOS
print('isMobile: $isMobile');   // true if on Android, iOS, Fuchsia
```