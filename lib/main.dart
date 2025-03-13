import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:learn/firebase_options.dart';
import 'package:learn/services/storage_service.dart';
import 'package:learn/views/home_view.dart';
import 'package:learn/views/login_view.dart';
import 'package:learn/views/register_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await StorageService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: 'Flutter Demo', home: LoginView());
  }
}
