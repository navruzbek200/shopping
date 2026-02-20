import 'package:flutter/material.dart';

class DecoratedBackground extends StatelessWidget {
  final Widget child;
  const DecoratedBackground({super.key, required this.child});

  static const bg = Color(0xFFF6E3D7);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: bg),

        // Top-right orange
        const Positioned(
          right: -40,
          top: -40,
          child: _Blob(color: Color(0xFFFF6A3D), w: 220, h: 150, r: 80),
        ),

        // Big soft blobs
        const Positioned(
          left: -120,
          top: 140,
          child: _Blob(color: Color(0xFFF1D5C6), w: 260, h: 520, r: 140),
        ),
        const Positioned(
          right: -90,
          top: 180,
          child: _Blob(color: Color(0xFFF7DCCB), w: 260, h: 520, r: 140),
        ),

        // Bottom yellow
        const Positioned(
          left: -120,
          bottom: 170,
          child: _Blob(color: Color(0xFFFFB300), w: 280, h: 260, r: 140),
        ),

        SafeArea(child: child),
      ],
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
