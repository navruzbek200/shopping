import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  static const _titleColor = Color(0xFF1D1C3B);

  int selectedTab = 0;

  final tabs = const ["New", "Furniture", "Electronic", "Fashion"];

  final products = const [
    _Product(price: "\$879.00", bg: Color(0xFFD8F3FF), asset: "assets/images/chair.png"),
    _Product(price: "\$2800.00", bg: Color(0xFFF7DDD2), asset: "assets/images/bike.png"),
    _Product(price: "\$219.00", bg: Color(0xFFF6E3B6), asset: "assets/images/bottle.png"),
    _Product(price: "\$165.00", bg: Color(0xFFDFF6F3), asset: "assets/images/bag.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top row: title + search
              Row(
                children: [
                  const Text(
                    "Product List",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: _titleColor,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, size: 26),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // tabs + grid icon
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
                                    color: active
                                        ? _titleColor
                                        : _titleColor.withValues(alpha: 0.45),
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

              // grid
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
                  itemBuilder: (context, i) => _ProductCard(p: products[i]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Product {
  final String price;
  final Color bg;
  final String asset;
  const _Product({required this.price, required this.bg, required this.asset});
}

class _ProductCard extends StatelessWidget {
  final _Product p;
  const _ProductCard({required this.p});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // colored card
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: p.bg,
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(18),
            child: Center(
              child: _AssetOrPlaceholder(asset: p.asset),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // price + more
        Row(
          children: [
            Text(
              p.price,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const Spacer(),
            const Icon(Icons.more_horiz, color: Colors.grey),
          ],
        ),
      ],
    );
  }
}

class _AssetOrPlaceholder extends StatelessWidget {
  final String asset;
  const _AssetOrPlaceholder({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => const Icon(Icons.image_outlined, size: 44),
    );
  }
}
