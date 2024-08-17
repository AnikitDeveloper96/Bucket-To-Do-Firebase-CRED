import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'provider/provider_theme.dart';
import 'screens/signin.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBzxHQGEo2mHe_Qx_dtX7LCUiNVKr5nMkU',
          appId: '1:49630497711:android:087275de3ae4201d857d5a',
          messagingSenderId: '49630497711',
          projectId: 'bucket-app-97f03'));

  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeNotifier>(context).getTheme(),
        home: const SplashScreen());
  }
}
