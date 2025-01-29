import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/wallet/presentation/screens/home_screen.dart';
import 'package:wallet_app/features/wallet/presentation/screens/send_money_screen.dart';
import 'package:provider/provider.dart';
import 'features/wallet/presentation/providers/wallet_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WalletProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modern Wallet App',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
