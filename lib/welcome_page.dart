import 'package:flutter/material.dart';
import 'product_list_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const _primary = Color(0xFF2D2A86);
  static const _bg = Color(0xFFF6E3D7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: _bg),

          Positioned(
            right: -40,
            top: -40,
            child: _Blob(color: const Color(0xFFFF6A3D), w: 200, h: 140, r: 70),
          ),
          Positioned(
            left: -120,
            top: 140,
            child: _Blob(color: const Color(0xFFF1D5C6), w: 260, h: 520, r: 120),
          ),
          Positioned(
            right: -70,
            top: 220,
            child: _Blob(color: const Color(0xFFF7DCCB), w: 240, h: 520, r: 120),
          ),
          Positioned(
            left: -110,
            bottom: 180,
            child: _Blob(color: const Color(0xFFFFB300), w: 260, h: 260, r: 120),
          ),

          // content
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 70),

                    Text(
                      "SHOPIN",
                      style: TextStyle(
                        color: _primary,
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
                        color: _primary,
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                      ),
                    ),

                    const SizedBox(height: 14),

                    Text(
                      "Experience a new way\nof shopping.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _primary,
                        fontSize: 18,
                        height: 1.35,
                      ),
                    ),

                    const Spacer(),

                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ProductListPage()),
                          );
                        },
                        child: const Text(
                          "Explore",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),

                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  final Color color;
  final double w, h, r;
  const _Blob({required this.color, required this.w, required this.h, required this.r});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(r),
      ),
    );
  }
}
