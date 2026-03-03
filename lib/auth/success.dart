import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import 'widgets.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthColors.background,
      body: Stack(
        children: [
          Positioned(
            right: -40,
            top: 100,
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Congratulations",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AuthColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Your account has been successfully created.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                primaryButton("Sign In", () {
                  context.go('/sign-in');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}