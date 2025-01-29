import 'package:flutter/material.dart';
import 'package:wallet_app/core/animations/animated_page.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/action_button.dart';
import '../widgets/transaction_item.dart';
import '../widgets/card_item.dart';
import '../screens/send_money_screen.dart';
import '../../domain/models/card_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  List<CardModel> get cards => [
        CardModel(
          cardNumber: '1234 5678 9012 3456',
          cardHolderName: 'M. Sufiyan',
          expiryDate: '12/25',
          balance: '60,890.67',
          cardType: 'PayPal',
          cardTypeIcon:
              'https://www.paypalobjects.com/webstatic/icon/pp258.png',
        ),
        CardModel(
          cardNumber: '9876 5432 1098 7654',
          cardHolderName: 'M. Sufiyan',
          expiryDate: '09/25',
          balance: '6,433.11',
          cardType: 'Visa',
          cardTypeIcon:
              'https://cdn.visa.com/v2/assets/images/logos/visa/blue/logo.png',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedPage(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(size.width * 0.04), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning!',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Sajibur Rahman',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        const Icon(Icons.notifications_outlined),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.03),

                // Balance Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total balance',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$67,323.78',
                      style: TextStyle(
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.03),

                // Action Buttons
                SizedBox(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ActionButton(
                        icon: Icons.add,
                        label: 'Send',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SendMoneyScreen(cards: cards),
                          ),
                        ),
                        size: size.width * 0.13,
                      ),
                      ActionButton(
                        icon: Icons.download,
                        label: 'Receive',
                        onTap: () {},
                        size: size.width * 0.13,
                      ),
                      ActionButton(
                        icon: Icons.credit_card,
                        label: 'Buy',
                        onTap: () {},
                        size: size.width * 0.13,
                      ),
                      ActionButton(
                        icon: Icons.swap_horiz,
                        label: 'Swap',
                        onTap: () {},
                        size: size.width * 0.13,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                // Cards Section
                Text(
                  'My Cards',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5,
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      final card = cards[index];
                      return CardItem(
                        backgroundColor: index == 0
                            ? const Color(0xFF1E1E99)
                            : const Color(0xFFFF2E63),
                        cardNumber:
                            '**** **** **** ${card.cardNumber.substring(card.cardNumber.length - 4)}',
                        cardHolderName: card.cardHolderName,
                        expiryDate: card.expiryDate,
                        cardTypeIcon: Image.network(
                          card.cardTypeIcon,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                // History Section
                const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TransactionItem(
                  title: 'PayPal',
                  subtitle: 'Receive',
                  amount: '550.00',
                  time: '12:23 PM',
                  icon: Image.network(
                      'https://www.paypalobjects.com/webstatic/icon/pp258.png'),
                  isPositive: true,
                ),

                TransactionItem(
                  title: 'Dribbble',
                  subtitle: 'Purchase',
                  amount: '89.00',
                  time: '9:34 PM',
                  icon: Image.network(
                      'https://cdn.dribbble.com/assets/dribbble-ball-mark-ea73545ccb83d575f9c0bc5f11a6937f2dd05159e3a768c0d5e6466aca2e0a7c.svg'),
                  isPositive: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
