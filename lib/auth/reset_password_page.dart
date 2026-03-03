import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import 'widgets.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

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
                "Password Reset",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AuthColors.primary,
                ),
              ),
              const SizedBox(height: 30),

              const Text("Enter your email address"),
              const SizedBox(height: 6),
              authInput(),

              const SizedBox(height: 30),
              primaryButton("Send", () {
                context.go('/reset-success');
              }),
            ],
          ),
        ),
      ),
    );
  }
}