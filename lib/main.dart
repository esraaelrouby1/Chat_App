import 'package:chat/firebase_options.dart';
import 'package:chat/screens/chatPage.dart';
import 'package:chat/screens/register_screen.dart';
import 'package:chat/screens/welcomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        Chatpage.id: (context) => Chatpage(),
      },
      initialRoute: WelcomePage.id,
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
