import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import 'widgets.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
                "Sign In",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AuthColors.primary,
                ),
              ),
              const SizedBox(height: 40),

              const Text("Email"),
              const SizedBox(height: 6),
              authInput(),

              const SizedBox(height: 20),
              const Text("Password"),
              const SizedBox(height: 6),
              authInput(obscure: true),

              const SizedBox(height: 30),
              primaryButton("Sign In", () {
                context.go('/products');
              }),

              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AuthColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Sign in with Facebook",
                    style: TextStyle(color: AuthColors.primary),
                  ),
                ),
              ),

              const Spacer(),

              Center(
                child: GestureDetector(
                  onTap: () => context.go('/reset-password'),
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: AuthColors.primary),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Center(
                child: GestureDetector(
                  onTap: () => context.go('/sign-up'),
                  child: const Text(
                    "Don't have an account? Sign up",
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