import 'package:flutter/material.dart';
import 'package:wallet_app/features/wallet/presentation/screens/home_screen.dart';
import 'package:wallet_app/features/wallet/presentation/screens/send_money_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modern Wallet App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
