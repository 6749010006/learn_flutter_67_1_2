import 'package:flutter/material.dart';
import 'package:learn_flutter_67_1_2/firt_screen.dart';
//step 4: Conect to Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(home: FirstScreen()));
}
