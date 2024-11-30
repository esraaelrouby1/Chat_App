import 'package:chat/const.dart';
import 'package:chat/helper/showSnackBar.dart';
import 'package:chat/screens/chatPage.dart';
import 'package:chat/widgets/custom_buton.dart';
import 'package:chat/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = 'registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? Password;

  bool isLoding = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        // backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 32,
                        color: Color.fromARGB(255, 84, 14, 95),
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 8,
                      child: Image.asset("assets/images/register.png"),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 32),
                CustomFormTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                  icon: Icon(Icons.person),
                ),
                const SizedBox(height: 20),
                CustomFormTextField(
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
                        await registerUser();
                        Navigator.pushNamed(context, Chatpage.id);
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
                        print(e);
                        showSnackBarMessage(
                          context,
                          "there was an error",
                        );
                      }
                      isLoding = false;
                      setState(() {});
                    }
                  },
                  title: 'Register',
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        ' login',
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

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: Password!);
  }
}
