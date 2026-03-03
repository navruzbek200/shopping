import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../auth/sign_in_page.dart';
import '../auth/sign_up_page.dart';
import '../auth/reset_password_page.dart';
import '../auth/new_password_page.dart';
import '../auth/auth_repository.dart';

import '../pages/welcome_page.dart';
import '../pages/product_list_page.dart';
import '../pages/product_details_page.dart';
import '../pages/reviews_page.dart';
import '../pages/cart_page.dart';
import '../pages/shipping_page.dart';
import '../pages/payment_page.dart';
import '../pages/checkout_page.dart';
import '../pages/success_page.dart';

class AppRouter {
  static final AuthRepository _authRepository = AuthRepository();

  static final GoRouter router = GoRouter(
    initialLocation: '/welcome',

    /// 🔐 GLOBAL REDIRECT
    redirect: (context, state) {
      final bool isLoggedIn = _authRepository.isSignedIn();

      final bool isAuthRoute =
          state.matchedLocation == '/sign-in' ||
              state.matchedLocation == '/sign-up' ||
              state.matchedLocation == '/reset-password' ||
              state.matchedLocation == '/new-password';

      final bool isProtectedRoute =
          state.matchedLocation.startsWith('/products') ||
              state.matchedLocation == '/cart' ||
              state.matchedLocation == '/shipping' ||
              state.matchedLocation == '/payment' ||
              state.matchedLocation == '/checkout';

      /// ❌ Login qilmagan user protected route ga kirsa
      if (!isLoggedIn && isProtectedRoute) {
        return '/sign-in';
      }

      /// ✅ Login qilgan user auth page ga qaytmasin
      if (isLoggedIn && isAuthRoute) {
        return '/products';
      }

      return null;
    },

    routes: [

      /// ================= AUTH =================

      GoRoute(
        path: '/sign-in',
        name: 'signIn',
        builder: (context, state) => const SignInPage(),
      ),

      GoRoute(
        path: '/sign-up',
        name: 'signUp',
        builder: (context, state) => const SignUpPage(),
      ),

      GoRoute(
        path: '/reset-password',
        name: 'resetPassword',
        builder: (context, state) => const ResetPasswordPage(),
      ),

      GoRoute(
        path: '/new-password',
        name: 'newPassword',
        builder: (context, state) => const NewPasswordPage(),
      ),

      /// ================= PUBLIC =================

      GoRoute(
        path: '/welcome',
        name: 'welcome',
        builder: (context, state) => const WelcomePage(),
      ),

      /// ================= PRODUCTS =================

      GoRoute(
        path: '/products',
        name: 'products',
        builder: (context, state) => const ProductListPage(),
        routes: [
          GoRoute(
            path: ':id',
            name: 'productDetails',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return ProductDetailsPage(productId: id);
            },
            routes: [
              GoRoute(
                path: 'reviews',
                name: 'reviews',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return ReviewsPage(productId: id);
                },
              ),
            ],
          ),
        ],
      ),

      /// ================= CART FLOW =================

      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) => const CartPage(),
      ),

      GoRoute(
        path: '/shipping',
        name: 'shipping',
        builder: (context, state) => const ShippingPage(),
      ),

      GoRoute(
        path: '/payment',
        name: 'payment',
        builder: (context, state) => const PaymentPage(),
      ),

      GoRoute(
        path: '/checkout',
        name: 'checkout',
        builder: (context, state) => const CheckoutPage(),
      ),

      GoRoute(
        path: '/success',
        name: 'success',
        builder: (context, state) => const SuccessPage(),
      ),
    ],
  );
}