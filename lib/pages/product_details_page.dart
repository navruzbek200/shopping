import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/product_repo.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});

  static const primary = Color(0xFF3F3DBF);

  @override
  Widget build(BuildContext context) {
    final product = ProductRepo.byId(productId);

    return Scaffold(
      appBar: AppBar(title: Text(product.title), leading: const BackButton()),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 320,
            color: product.bg,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.06),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    product.asset,
                    width: 190,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_outlined, size: 90),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Text(product.price, style: const TextStyle(fontWeight: FontWeight.w800)),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          Text(product.category,
              style: TextStyle(color: Colors.black.withValues(alpha: 0.45), fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                _Stars(value: product.rating),
                const SizedBox(width: 10),
                Text(product.rating.toStringAsFixed(1),
                    style: TextStyle(color: Colors.black.withValues(alpha: 0.70), fontWeight: FontWeight.w700)),
                const Spacer(),
                InkWell(
                  onTap: () => context.go('/products/$productId/reviews'),
                  child: Text(
                    "${product.reviewsCount} reviews",
                    style: const TextStyle(color: primary, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                ),
                onPressed: () => context.goNamed('cart'),
                child: const Text("Add to Cart", style: TextStyle(fontWeight: FontWeight.w800)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  final double value;
  const _Stars({required this.value});

  @override
  Widget build(BuildContext context) {
    final full = value.floor();
    return Row(
      children: List.generate(
        5,
            (i) => Icon(
          i < full ? Icons.star_rounded : Icons.star_border_rounded,
          size: 18,
          color: const Color(0xFFFFB300),
        ),
      ),
    );
  }
}
