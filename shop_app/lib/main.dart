import 'package:flutter/material.dart';
import 'package:shop_app/helpers/custom_route.dart';
import 'package:shop_app/pages/auth_page.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/edit_product_page.dart';
import 'package:shop_app/pages/orders_page.dart';
import 'package:shop_app/pages/product_detail_page.dart';
import 'package:shop_app/pages/products_overview_page.dart';
import 'package:shop_app/pages/splash_page.dart';
import 'package:shop_app/pages/user_products_page.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/orders.dart';
import './providers/products_provider.dart';
import 'package:provider/provider.dart';

import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: ((ctx, auth, previousProducts) => Products(
                auth.token,
                auth.userId,
                previousProducts == null ? [] : previousProducts.items,
              )),
          create: (ctx) => Products('', '', []),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (ctx) => Orders('', '', []),
          update: ((context, value, previous) => Orders(
                value.token,
                value.userId,
                previous == null ? [] : previous.orders,
              )),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, child) => MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            colorScheme: theme.colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.deepOrange,
            ),
            fontFamily: 'Lato',
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CustomPageTransitionBuilder(),
                TargetPlatform.iOS: CustomPageTransitionBuilder(),
              },
            ),
          ),
          // home: const ProductsOverviewPage(),
          home: auth.isAuth
              ? const ProductsOverviewPage()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? const SplashPage()
                          : const AuthPage(),
                ),
          routes: {
            ProductDetailPage.routeName: (ctx) => const ProductDetailPage(),
            CartPage.routeName: ((ct) => const CartPage()),
            OrdersPage.routeName: (ctx) => const OrdersPage(),
            UserProductsPage.routeName: (ctx) => const UserProductsPage(),
            EditProductPage.routeName: ((context) => const EditProductPage()),
          },
        ),
      ),
    );
  }
}
