// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/my_button.dart';
import 'package:untitled/square_tale.dart';
import 'my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

 // sign in method
 void signUserIn() async {
   await FirebaseAuth.instance.signInWithEmailAndPassword(
       email: usernameController.text,
       password: passwordController.text,
   );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.gamepad,
                size: 120,
              ),

              // greeting
              const SizedBox(height: 50),
              Text(
                  "Welcome back, you've missed!",
                style: TextStyle(
                    color: Colors.grey[900],
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),


              // username text field
              MyTextField(
                controller: usernameController,
                obscureText: false,
                hintText: "Username",
              ),

              const SizedBox(height: 10),

              // password text field
              MyTextField(
                controller: passwordController,
                obscureText: true,
                hintText: "Password",
              ),
              const SizedBox(height:10),

              // forgot the password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        "Forgot the password?",
                      style: TextStyle(
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height:25),

              // sign in button
              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 20),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                          "Or continue with:",
                        style: TextStyle(color: Colors.grey[900]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // google, apple sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: "lib/images_png/Google_logo.png"),

                  SizedBox(width: 25),
                  // apple button
                  SquareTile(imagePath: "lib/images_png/Apple_logo.png")
                ],
              ),
              const SizedBox(height: 30),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Not a member?",
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                      "Register now",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
