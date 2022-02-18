import 'dart:io';

import 'package:build_flavor_demo/env_config.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseDefaultConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      switch (Env.appEnv) {
        case EnvName.prod:
          return const FirebaseOptions(
            appId: '1:311657842655:ios:3da64ba2c1f2ed5d8c666a',
            apiKey: 'AIzaSyDO3351rzUqdgoMBdXMsDuo86KZCD5woJU',
            projectId: 'pushdemo-c8b80',
            messagingSenderId: '311657842655',
            iosBundleId: "com.dispy.buildFlavorDemo",
            iosClientId: "311657842655-kg8j2rck2h4tjm7rtc29qeq8ld5nunts.apps.googleusercontent.com"
          );
        case EnvName.beta:
          return const FirebaseOptions(
            appId: '1:311657842655:ios:b9f2f508e5c9ba7a8c666a',
            apiKey: 'AIzaSyDO3351rzUqdgoMBdXMsDuo86KZCD5woJU',
            projectId: 'pushdemo-c8b80',
            messagingSenderId: '311657842655',
            iosBundleId: "com.dispy.buildFlavorDemo.beta",
            iosClientId: "311657842655-va22pjch8tsqdjaue82718amjmuvpepn.apps.googleusercontent.com"
          );
        case EnvName.dev:
          return const FirebaseOptions(
            appId: '1:311657842655:ios:9674c42729044ea68c666a',
            apiKey: 'AIzaSyDO3351rzUqdgoMBdXMsDuo86KZCD5woJU',
            projectId: 'pushdemo-c8b80',
            messagingSenderId: '311657842655',
            iosBundleId: "com.dispy.buildFlavorDemo.dev",
            iosClientId: "311657842655-a50jd0m2v2qcusrq437ovn6bqp6s297n.apps.googleusercontent.com"
          );
        default:
          throw NoSuchFirebaseConfigException(
              "Cannot find config with this build flavor.");
      }
    } else if (Platform.isAndroid) {
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
          throw NoSuchFirebaseConfigException(
              "Cannot find config with this build flavor.");
      }
    } else {
      throw NoSuchFirebaseConfigException(
          "This APP is currently only compatible with Android and iOS");
    }
  }
}

class NoSuchFirebaseConfigException implements Exception {
  String description;
  NoSuchFirebaseConfigException(this.description);
}
