import 'package:flutter/material.dart';

class ReviewsPage extends StatelessWidget {
  final String productId;
  const ReviewsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reviews(45)"), leading: const BackButton()),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _ReviewTile(name: "Jessie Phelps", title: "Great chair", text: "Sturdy and comfortable. Very happy!"),
          _ReviewTile(name: "Larry May", title: "Love new chairs", text: "Great addition to my office."),
          _ReviewTile(name: "Bradley Parks", title: "Place to relax", text: "Nice comfy spot to decompress."),
          _ReviewTile(name: "Jackson Rogers", title: "Worth it", text: "Professional delivery. Thanks."),
        ],
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  final String name, title, text;
  const _ReviewTile({required this.name, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withValues(alpha: 0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(child: Icon(Icons.person)),
              const SizedBox(width: 10),
              Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w800))),
              const _Stars(stars: 5),
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          Text(text, style: TextStyle(color: Colors.black.withValues(alpha: 0.65))),
        ],
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  final int stars;
  const _Stars({required this.stars});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
            (i) => Icon(
          i < stars ? Icons.star_rounded : Icons.star_border_rounded,
          size: 16,
          color: const Color(0xFFFFB300),
        ),
      ),
    );
  }
}
