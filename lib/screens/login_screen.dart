import 'package:chat/const.dart';
import 'package:chat/helper/showSnackBar.dart';
import 'package:chat/screens/chatPage.dart';
import 'package:chat/screens/register_screen.dart';
import 'package:chat/widgets/custom_buton.dart';
import 'package:chat/widgets/custom_text_field.dart';
import 'package:chat/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "loginPage";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? Password;

  bool isLoding = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        //backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 84, 14, 95),
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 8,
                      child: Image.asset("assets/images/login.png"),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 50),
                CustomFormTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                  icon: Icon(Icons.person),
                ),
                const SizedBox(height: 20),
                CustomFormTextField(
                  obscureText: false,
                  onChanged: (data) {
                    Password = data;
                  },
                  hintText: 'Passward',
                  icon: Icon(Icons.lock),
                ),
                const SizedBox(height: 24),
                CustomButon(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoding = true;
                        setState(() {});
                        try {
                          await loginUser();
                          Navigator.pushNamed(context, Chatpage.id,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBarMessage(
                                context, "The password provided is too weak.");
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBarMessage(
                              context,
                              "The account already exists for that email.",
                            );
                          }
                        } catch (e) {
                          showSnackBarMessage(
                            context,
                            "there was an error",
                          );
                          print(e);
                        }
                        isLoding = false;
                        setState(() {});
                      }
                    },
                    title: 'login'),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'dont\'t have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                      child: const Text(
                        ' Register',
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: Password!);
  }
}
