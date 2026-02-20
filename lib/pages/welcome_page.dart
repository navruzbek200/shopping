import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/decorated_background.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const primary = Color(0xFF2D2A86);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 70),

                Text(
                  "SHOPING",
                  style: TextStyle(
                    color: primary,
                    fontSize: 44,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 10,
                  ),
                ),
                const SizedBox(height: 36),

                Text(
                  "Amazing shopping",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primary,
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 14),

                Text(
                  "Experience a new way\nof shopping.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primary, fontSize: 18, height: 1.35),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    onPressed: () => context.go('/products'),
                    child: const Text("Explore", style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
