import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import 'widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                "Sign Up",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AuthColors.primary,
                ),
              ),
              const SizedBox(height: 40),

              const Text("Name"),
              const SizedBox(height: 6),
              authInput(),

              const SizedBox(height: 20),
              const Text("Email"),
              const SizedBox(height: 6),
              authInput(),

              const SizedBox(height: 20),
              const Text("Password"),
              const SizedBox(height: 6),
              authInput(obscure: true),

              const SizedBox(height: 20),
              const Text("Confirm Password"),
              const SizedBox(height: 6),
              authInput(obscure: true),

              const SizedBox(height: 30),
              primaryButton("Sign Up", () {
                context.go('/congrats');
              }),

              const Spacer(),

              Center(
                child: GestureDetector(
                  onTap: () => context.go('/sign-in'),
                  child: const Text(
                    "Already have an account? Sign In",
                    style: TextStyle(
                        color: AuthColors.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}