import 'package:chat/const.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/register_screen.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static String id = 'WelcomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome To Chat App",
              style: TextStyle(
                fontSize: 32,
                color: Color.fromARGB(255, 84, 14, 95),
                fontFamily: 'Pacifico',
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: Image.asset("assets/images/wchat.webp"),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 86, 7, 91),
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const RegisterScreen();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryLightColor,
                        elevation: 0,
                      ),
                      child: Text(
                        "Register",
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Pacifico',
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
