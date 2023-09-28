import 'package:flutter/material.dart';
import 'package:suja_shoie_app/feature/presentation/api_services/login_api%20.dart';

import '../../../../constant/utils/custom_button.dart';

class Auth extends StatefulWidget {
  static const String routName = "/auth_screen";
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  final LoginApiService loginScreen = LoginApiService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true; // Initially, hide the password

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void logInUser() {
    (loginScreen.login(
      context: context,
      loginId: _emailController.text,
      password: _passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signinFormKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 78),
        child: Column(
          children: [
         TextFormField(
  controller: _emailController,
  style: const TextStyle(color: Colors.black),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter EmployeId';
    }
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Email/Phone cannot contain special symbols';
    }
    if (value.contains(' ')) {
      return 'Email/Phone cannot contain spaces';
    }
    return null;
  },
  decoration: InputDecoration(
    hintText: 'Enter Employee Id',
    hintStyle: const TextStyle(color: Colors.black45),
    filled: true,
    fillColor: Colors.white,
    labelStyle: const TextStyle(fontSize: 12),
    contentPadding: const EdgeInsets.only(left: 30),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey.shade50),
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey.shade50),
      borderRadius: BorderRadius.circular(5),
    ),
  ),
),
            const SizedBox(height: 30),
            TextFormField(
              controller: _passwordController,
              style: const TextStyle(color: Colors.black),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.black45),
                counterText: 'Forgot password?',
                counterStyle: const TextStyle(color: const Color(0xFF25476A), fontSize: 13),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  child: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined, // Toggle the visibility icon
                    color: const Color(0xFF25476A),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                labelStyle: const TextStyle(fontSize: 12),
                contentPadding: const EdgeInsets.only(left: 30),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade50),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              obscureText: _obscurePassword, // Toggle password visibility
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: "Sign In",
              onTap: () {
                if (signinFormKey.currentState?.validate() == true) {
                  logInUser();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}