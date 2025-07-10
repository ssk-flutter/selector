import 'package:flutter_test/flutter_test.dart';
import 'package:selector/selector.dart';

void main() {
  group('selector', () {
    test('returns web value on web platform', () {
      final result = selector(
        debugPlatform: 'web',
        web: 'web',
        android: 'android',
        ios: 'ios',
        macos: 'macos',
        fuchsia: 'fuchsia',
        linux: 'linux',
        windows: 'windows',
      );
      expect(result, 'web');
    });

    test('returns android value on android platform', () {
      final result = selector(
        debugPlatform: 'android',
        web: 'web',
        android: 'android',
        ios: 'ios',
        macos: 'macos',
        fuchsia: 'fuchsia',
        linux: 'linux',
        windows: 'windows',
      );
      expect(result, 'android');
    });

    test('returns ios value on ios platform', () {
      final result = selector(
        debugPlatform: 'ios',
        web: 'web',
        android: 'android',
        ios: 'ios',
        macos: 'macos',
        fuchsia: 'fuchsia',
        linux: 'linux',
        windows: 'windows',
      );
      expect(result, 'ios');
    });

    test('returns macos value on macos platform', () {
      final result = selector(
        debugPlatform: 'macos',
        web: 'web',
        android: 'android',
        ios: 'ios',
        macos: 'macos',
        fuchsia: 'fuchsia',
        linux: 'linux',
        windows: 'windows',
      );
      expect(result, 'macos');
    });

    test('throws UnsupportedError for unknown platform', () {
      expect(
        () => selector(
          debugPlatform: 'unknown',
          web: 'web',
          android: 'android',
          ios: 'ios',
          macos: 'macos',
          fuchsia: 'fuchsia',
          linux: 'linux',
          windows: 'windows',
        ),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });

  group('optionalSelector', () {
    test('returns web value on web platform', () {
      final result = optionalSelector(
        debugPlatform: 'web',
        web: 'web',
        android: 'android',
      );
      expect(result, 'web');
    });

    test('returns null for not provided platform or unknown platform', () {
      final result1 = optionalSelector(
        debugPlatform: 'ios',
        android: 'android',
      );
      expect(result1, isNull);

      final result2 = optionalSelector(debugPlatform: 'unknown');
      expect(result2, isNull);
    });
  });

  group('deviceSelector', () {
    test('returns web value on web device', () {
      final result = deviceSelector(
        debugDeviceType: 'web',
        mobile: 'mobile',
        desktop: 'desktop',
        web: 'web',
      );
      expect(result, 'web');
    });

    test('returns mobile value on mobile device', () {
      final result = deviceSelector(
        debugDeviceType: 'mobile',
        mobile: 'mobile',
        desktop: 'desktop',
        web: 'web',
      );
      expect(result, 'mobile');
    });

    test('returns desktop value on desktop device', () {
      final result = deviceSelector(
        debugDeviceType: 'desktop',
        mobile: 'mobile',
        desktop: 'desktop',
        web: 'web',
      );
      expect(result, 'desktop');
    });

    test('throws UnsupportedError for unknown device type', () {
      expect(
        () => deviceSelector(
          debugDeviceType: 'unknown',
          mobile: 'mobile',
          desktop: 'desktop',
          web: 'web',
        ),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });

  group('optionalDeviceSelector', () {
    test('returns web value on web device', () {
      final result = optionalDeviceSelector(
        debugDeviceType: 'web',
        web: 'web',
      );
      expect(result, 'web');
    });

    test('returns null for not provided device type', () {
      final result = optionalDeviceSelector(
        debugDeviceType: 'mobile',
        desktop: 'desktop',
      );
      expect(result, isNull);
    });

    test('throws UnsupportedError for unknown device type', () {
      expect(
        () => optionalDeviceSelector(debugDeviceType: 'unknown'),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });

  group('selectOrElse', () {
    test('returns android value on android platform', () {
      final result = selectOrElse(
        debugPlatform: 'android',
        android: 'android',
        orElse: 'default',
      );
      expect(result, 'android');
    });

    test('returns orElse value for not provided platform', () {
      final result = selectOrElse(
        debugPlatform: 'ios',
        android: 'android',
        orElse: 'default',
      );
      expect(result, 'default');
    });

    test('returns orElse value for unknown platform', () {
      final result = selectOrElse(
        debugPlatform: 'unknown',
        orElse: 'default',
      );
      expect(result, 'default');
    });
  });
}