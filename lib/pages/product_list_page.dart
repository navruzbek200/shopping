import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/product_repo.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  static const titleColor = Color(0xFF1D1C3B);

  int selectedTab = 0;
  final tabs = const ["New", "Furniture", "Electronic", "Fashion"];

  @override
  Widget build(BuildContext context) {
    final products = ProductRepo.products;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Product List",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: titleColor),
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 26)),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 34,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: tabs.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 28),
                        itemBuilder: (context, i) {
                          final active = i == selectedTab;
                          return GestureDetector(
                            onTap: () => setState(() => selectedTab = i),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tabs[i],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                                    color: active ? titleColor : titleColor.withValues(alpha: 0.45),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: 2,
                                  width: active ? 26 : 0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFF4D3D),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.grid_view_rounded, color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 18,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, i) {
                    final p = products[i];
                    return InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () => context.go('/products/${p.id}'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: p.bg,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.all(18),
                              child: Center(
                                child: Image.asset(
                                  p.asset,
                                  fit: BoxFit.contain,
                                  errorBuilder: (_, __, ___) =>
                                  const Icon(Icons.image_outlined, size: 44),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(p.price,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                              const Spacer(),
                              const Icon(Icons.more_horiz, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
