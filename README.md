# Zarity Health Blog App

## Project Setup Instructions

1. **Clone the Repository**
   ```sh
   git clone https://github.com/your-repo/blog-app.git
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

## Assumptions & Additional Features

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

---

## Project Structure
```
lib/
│-- main.dart                  # Entry point of the app
│-- src/
│   ├── models/                # Data models
│   ├── views/                 # UI screens (BlogListScreen, BlogDetailScreen, etc.)
│   ├── controllers/           # Business logic and controllers
│   ├── widgets/               # Reusable UI components (CustomDrawer, Buttons, etc.)
│   ├── services/              # Firebase services and API calls
│   ├── providers/             # State management using Provider
│-- assets/                     # Images and fonts
│-- pubspec.yaml                # Project dependencies
```

This structure ensures **modularity, scalability, and maintainability**.

---

## Contributions
Pull requests are welcome! Ensure that you follow best practices and write clean, readable code.

Happy Coding! 🚀

