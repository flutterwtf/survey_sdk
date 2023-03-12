cd core
flutter packages get
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test --coverage
lcov --remove coverage/lcov.info '*.g.dart' '*.part.dart' '*/generated/*' -o coverage/lcov.info
./coverage_check.sh