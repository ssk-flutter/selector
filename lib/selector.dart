import 'dart:io';

T selector<T>({
  T android,
  T ios,
  T mac,
  T fuchsia,
  T linux,
  T windows,
}) {
  if (Platform.isAndroid) return android;
  if (Platform.isIOS) return ios;
  if (Platform.isFuchsia) return fuchsia;
  if (Platform.isLinux) return linux;
  if (Platform.isMacOS) return mac;
  if (Platform.isWindows) return windows;

  throw 'Unidentified platform ${Platform.operatingSystem}';
}
