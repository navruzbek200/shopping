import 'package:go_router/go_router.dart';

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
  static final router = GoRouter(
    initialLocation: '/welcome',
    routes: [
      GoRoute(
        path: '/welcome',
        name: 'welcome',
        builder: (context, state) => const WelcomePage(),
      ),

      GoRoute(
        path: '/products',
        name: 'products',
        builder: (context, state) => const ProductListPage(),
        routes: [
          // /products/1
          GoRoute(
            path: ':id',
            name: 'productDetails',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return ProductDetailsPage(productId: id);
            },
            routes: [
              // /products/1/reviews
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
