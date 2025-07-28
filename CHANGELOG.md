## 4.0.0-dev.4
* Reintroduced explicit `mobileOrElse` and `desktopOrElse` functions.

## 4.0.0-dev.3
* Split selector into platform-specific files (`selector_stub.dart`, `selector_io.dart`, `selector_web.dart`).

## 4.0.0-dev.2
* Reintroduced explicit `...OrElse` functions for clarity.

## 4.0.0-dev.1
* API Rework: Renamed `mac` to `macos`, consolidated `...OrElse` functions into `selectOrElse`.
* Added web platform support to `selector` and `optionalSelector`.
* Changed `optionalSelector` behavior to return `null` for unhandled platforms.
* Improved testability and added comprehensive unit tests.
* Enhanced documentation and examples.

## 3.0.0
* migrate to flutter 3

## 0.3.0
* support null-safety

## 0.2.0

* introduce deviceSelector

## 0.1.0

* introduce `***OrElse`
