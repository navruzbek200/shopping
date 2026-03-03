import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import 'widgets.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "New Password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AuthColors.primary,
                ),
              ),
              const SizedBox(height: 30),

              const Text("New Password"),
              const SizedBox(height: 6),
              authInput(obscure: true),

              const SizedBox(height: 20),
              const Text("Confirm Password"),
              const SizedBox(height: 6),
              authInput(obscure: true),

              const SizedBox(height: 30),
              primaryButton("Save", () {
                context.go('/sign-in');
              }),
            ],
          ),
        ),
      ),
    );
  }
}