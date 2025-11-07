import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/product_provider.dart';
import 'screens/home_page.dart';

void main() {
  runApp(
    // MultiProvider - Sử dụng nhiều providers cùng lúc
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Consumer - Lắng nghe thay đổi từ ThemeProvider
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Provider Pattern Demo',
          theme: themeProvider.themeData,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
