# Zarity Health Blog App

## Project Setup Instructions

1. **Clone the Repository**
   ```sh
   git clone "https://github.com/sadityak2003/Zarity-Health.git"
   cd blog-app
   ```

2. **Install Dependencies**
   ```sh
   flutter pub get
   ```

3. **Set Up Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
   - Add an Android/iOS app and download the `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) file.
   - Place the file in the respective `android/app/` or `ios/Runner/` directory.
   - Enable Firestore and Authentication in Firebase.

4. **Run the Application**
   ```sh
   flutter run
   ```

---

## Additional Features

- The app fetches blog posts from **Cloud Firestore**.
- Images are stored via Firestore links.
- A custom drawer for navigation is implemented.
- `Provider` is used for state management.
- Error handling and loading indicators are included.

---

## State Management Solution

This project uses **Provider** for state management, ensuring efficient UI updates and separation of concerns.

To use Provider, the app is wrapped with `MultiProvider` in `main.dart`:
```dart
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
```

