import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static const primary = Color(0xFF3F3DBF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Shipping Address", style: TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text("Berlin, Schinkenstraße 35",
                style: TextStyle(color: Colors.black.withValues(alpha: 0.65))),
            const SizedBox(height: 16),

            const Text("Payment", style: TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text("Master Card **** 5708",
                style: TextStyle(color: Colors.black.withValues(alpha: 0.65))),
            const SizedBox(height: 16),

            const Text("Review Products", style: TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            Row(
              children: [
                _miniBox(),
                const SizedBox(width: 10),
                _miniBox(),
                const SizedBox(width: 10),
                _miniBox(),
              ],
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => context.goNamed('success'),
                child: const Text("Place Order  \$1079"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _miniBox() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.black.withValues(alpha: 0.05),
      ),
      child: const Icon(Icons.image_outlined),
    );
  }
}
