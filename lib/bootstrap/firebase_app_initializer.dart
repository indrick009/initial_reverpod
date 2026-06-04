import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';

final class FirebaseAppInitializer {
  const FirebaseAppInitializer._();

  static Future<FirebaseApp> initializeDefaultApp() async {
    if (Firebase.apps.isNotEmpty) {
      return Firebase.app();
    }

    try {
      return await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } on FirebaseException catch (error) {
      if (error.code == 'duplicate-app') {
        return Firebase.app();
      }

      rethrow;
    }
  }
}
