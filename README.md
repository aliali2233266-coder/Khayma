# Khayma Taxi

Flutter prototype for customer/driver taxi flows in Thi Qar, Iraq.

## What is included
- Existing `lib/main.dart` preserved as supplied.
- Android project scaffold with application id `com.khayma.taxi`.
- GitHub Actions workflow that can build a release APK in the cloud.

## Build on a computer
1. Install Flutter stable.
2. Open this folder in a terminal.
3. Run `flutter pub get`.
4. Run `flutter build apk --release`.
5. APK: `build/app/outputs/flutter-apk/app-release.apk`.

## Build from a phone using GitHub Actions
1. Upload this project to the GitHub repository.
2. Open the repository > Actions.
3. Run **Build Android APK**.
4. Open the completed workflow run.
5. Download the `khayma-taxi-release-apk` artifact.
6. Extract it and install the APK on the Samsung Note 10.

This prototype does not yet include a real map, authentication, backend, GPS tracking, payments, or live driver matching.
