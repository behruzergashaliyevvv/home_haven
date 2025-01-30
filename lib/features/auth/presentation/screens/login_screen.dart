import 'package:flutter/material.dart';
import 'package:dars_3/features/auth/presentation/controller/auth_provider.dart';
import 'package:dars_3/features/auth/presentation/screens/register_screen.dart';
import 'package:dars_3/features/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "phone",
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "password",
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                await authProvider.loginWithPhone(
                  phoneNumber: phoneController.text.trim(),
                  password: passwordController.text.trim(),
                );
              },
              child: Text(
                "Login",
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              ),
              child: Text(
                "Don't have an account? Register",
              ),
            ),
          ],
        );
      },
    ));
  }
}
