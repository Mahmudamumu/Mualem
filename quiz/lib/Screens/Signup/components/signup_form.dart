import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  Future<void> signUpWithEmailAndPassword(
      String email, String password, String firstName, String lastName) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Add user details to Realtime Database
      final DatabaseReference userRef = FirebaseDatabase.instance
          .reference()
          .child('users/${userCredential.user!.uid}/profile');
      await userRef.set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      });

      // User created successfully
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
      child: Column(
        children: [
          //
          TextFormField(
            controller: firstNameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (fname) {},
            decoration: InputDecoration(
              hintText: "First Name",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextFormField(
              controller: lastNameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (lname) {},
              decoration: InputDecoration(
                hintText: "Last Name",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.email),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),

          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              if (firstNameController.text.isEmpty ||
                  lastNameController.text.isEmpty ||
                  emailController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Please fill all the fiels"),
                ));
              } else {
                signUpWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                    firstNameController.text,
                    lastNameController.text);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("user created"),
                ));

//clear textbox
                firstNameController.clear();
                lastNameController.clear();
                emailController.clear();
                passwordController.clear();

//navigate to login page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: defaultPadding), // set the desired vertical padding
            child: SizedBox(height: defaultPadding / 2),
          ),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Future<void> signUpWithEmailAndPassword(String email, String password) async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   try {
  //     UserCredential userCredential = await auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     // User created successfully
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
