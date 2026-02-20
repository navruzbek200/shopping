import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/decorated_background.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  static const primary = Color(0xFF2D2A86);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                Text(
                  "Congratulations",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primary,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Your order has been successfully\nplaced.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primary.withValues(alpha: 0.75),
                    fontSize: 14,
                    height: 1.3,
                  ),
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
                    child: const Text("Continue Shopping"),
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
