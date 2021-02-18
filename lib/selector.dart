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

T androidOrElse<T>(T android, T elsePlatform) {
  if (Platform.isAndroid) return android;
  return elsePlatform;
}

T iosOrElse<T>(T ios, T elsePlatform) {
  if (Platform.isIOS) return ios;
  return elsePlatform;
}

T fuchsiaOrElse<T>(T fuchsia, T elsePlatform) {
  if (Platform.isFuchsia) return fuchsia;
  return elsePlatform;
}

T linuxOrElse<T>(T linux, T elsePlatform) {
  if (Platform.isLinux) return linux;
  return elsePlatform;
}

T macOrElse<T>(T mac, T elsePlatform) {
  if (Platform.isMacOS) return mac;
  return elsePlatform;
}

T windowsOrElse<T>(T windows, T elsePlatform) {
  if (Platform.isWindows) return windows;
  return elsePlatform;
}
