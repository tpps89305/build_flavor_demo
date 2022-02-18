import 'package:build_flavor_demo/env_config.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseDefaultConfig {
  static FirebaseOptions get platformOptions {
    switch (Env.appEnv) {
      case EnvName.prod:
        return const FirebaseOptions(
          appId: '1:311657842655:android:db0a8c5bd1f3ba8c8c666a',
          apiKey: 'AIzaSyCGr2lbIrzyiW8XgLiZLJL-mGyMU-9V0tE',
          projectId: 'pushdemo-c8b80',
          messagingSenderId: '311657842655',
        );
      case EnvName.beta:
        return const FirebaseOptions(
          appId: '1:311657842655:android:db30b66fd69ecb108c666a',
          apiKey: 'AIzaSyCGr2lbIrzyiW8XgLiZLJL-mGyMU-9V0tE',
          projectId: 'pushdemo-c8b80',
          messagingSenderId: '311657842655',
        );
      case EnvName.dev:
        return const FirebaseOptions(
          appId: '1:311657842655:android:aa0a4ae66483cfb58c666a',
          apiKey: 'AIzaSyCGr2lbIrzyiW8XgLiZLJL-mGyMU-9V0tE',
          projectId: 'pushdemo-c8b80',
          messagingSenderId: '311657842655',
        );
      default:
        // Default is prod target
        return const FirebaseOptions(
          appId: '1:311657842655:android:db0a8c5bd1f3ba8c8c666a',
          apiKey: 'AIzaSyCGr2lbIrzyiW8XgLiZLJL-mGyMU-9V0tE',
          projectId: 'pushdemo-c8b80',
          messagingSenderId: '311657842655',
        );
    }
  }
}
