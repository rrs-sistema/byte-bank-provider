import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../screens/screens.dart';
import './models/models.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FirebaseCrashlytics.instance.setUserIdentifier('User: ${DateTime.now().millisecondsSinceEpoch} - System ${Platform.operatingSystem} - Version ${Platform.version}');
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }
  
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Saldo(0)
      ),
      ChangeNotifierProvider(
        create: (context) => Transferencias()
      )
    ],
    child: BytebankApp(),
  ));
}

class BytebankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[900],
        secondaryHeaderColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
