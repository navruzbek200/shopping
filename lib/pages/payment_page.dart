import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  static const primary = Color(0xFF3F3DBF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Method"),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: const [
                _PayChip("PayPal"),
                SizedBox(width: 12),
                _PayChip("Master"),
                SizedBox(width: 12),
                _PayChip("VISA"),
              ],
            ),
            const SizedBox(height: 18),
            const TextField(decoration: InputDecoration(labelText: "Name", hintText: "Gabriel Chapman")),
            const SizedBox(height: 14),
            const TextField(decoration: InputDecoration(labelText: "Card number", hintText: "**** **** **** 5708")),
            const SizedBox(height: 14),
            const TextField(decoration: InputDecoration(labelText: "Expiry Date", hintText: "06/23")),
            const SizedBox(height: 14),
            const TextField(decoration: InputDecoration(labelText: "CVC", hintText: "***")),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => context.goNamed('checkout'),
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PayChip extends StatelessWidget {
  final String label;
  const _PayChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}
