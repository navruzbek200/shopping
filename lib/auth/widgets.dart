import 'package:flutter/material.dart';
import 'theme.dart';

Widget authInput({bool obscure = false}) {
  return TextField(
    obscureText: obscure,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white.withOpacity(0.7),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

Widget primaryButton(String text, VoidCallback onTap) {
  return SizedBox(
    width: double.infinity,
    height: 48,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AuthColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onTap,
      child: Text(text),
    ),
  );
}