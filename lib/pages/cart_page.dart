import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const primary = Color(0xFF3F3DBF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        leading: BackButton(onPressed: () => context.pop()),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _confirmDeleteAll(context),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _cartItem(context, "Rains Backpack Pacific", "\$580"),
            _cartItem(context, "Camber Table Lamp", "\$120"),
            _cartItem(context, "Orange Chair", "\$879"),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => context.goNamed('shipping'),
                child: const Text("Check Out  \$1079"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartItem(BuildContext context, String title, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withValues(alpha: 0.06)),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.shopping_bag_outlined),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
          Text(price, style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => _confirmDeleteOne(context, title),
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteAll(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Empty Cart"),
        content: const Text("Are you sure you want to delete all items?"),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () => context.pop(),
            child: const Text("Empty Cart"),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteOne(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Delete $title?"),
        content: const Text("Are you sure you want to delete this item?"),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text("Cancel")),
          ElevatedButton(onPressed: () => context.pop(), child: const Text("Delete")),
        ],
      ),
    );
  }
}
