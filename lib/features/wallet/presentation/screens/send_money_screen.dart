import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/contact_avatar.dart';
import '../widgets/custom_numpad.dart';
import '../providers/send_money_provider.dart';
import '../widgets/card_selector_sheet.dart';
import '../../domain/models/card_model.dart';
import '../screens/payment_success_screen.dart';
import '../../../../core/animations/animated_page.dart';

class SendMoneyScreen extends StatelessWidget {
  final List<CardModel> cards;

  const SendMoneyScreen({
    Key? key,
    required this.cards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SendMoneyProvider()..setCards(cards),
      child: const SendMoneyScreenContent(),
    );
  }
}

class SendMoneyScreenContent extends StatelessWidget {
  const SendMoneyScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<SendMoneyProvider>();

    return AnimatedPage(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Send Money',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black87),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              // Card selector
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => CardSelectorSheet(
                      cards: provider.cards,
                      selectedIndex:
                          provider.cards.indexOf(provider.selectedCard),
                      onCardSelected: provider.selectCard,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.01,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.015,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        provider.selectedCard.cardTypeIcon,
                        height: size.width * 0.06,
                      ),
                      SizedBox(width: size.width * 0.03),
                      Text(
                        '**** ${provider.selectedCard.cardNumber.substring(provider.selectedCard.cardNumber.length - 4)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),

              // Send To section
              Padding(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Send To',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                      height: size.width * 0.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          ContactAvatar(
                            icon: Icons.add,
                            label: 'Add',
                            isAdd: true,
                          ),
                          ContactAvatar(
                            imageUrl: 'https://i.pravatar.cc/150?img=1',
                            label: 'Daniel',
                            isSelected: true,
                          ),
                          ContactAvatar(
                            imageUrl: 'https://i.pravatar.cc/150?img=2',
                            label: 'Ethan',
                          ),
                          ContactAvatar(
                            imageUrl: 'https://i.pravatar.cc/150?img=3',
                            label: 'James',
                          ),
                          ContactAvatar(
                            imageUrl: 'https://i.pravatar.cc/150?img=4',
                            label: 'Michael',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Amount section
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${provider.amount}',
                    style: TextStyle(
                      fontSize: size.width * 0.09,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Text(
                    'Your balance: \$${provider.selectedCard.balance} (available)',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),

                  // Numpad
                  SizedBox(
                    height: size.height * 0.35,
                    child: CustomNumpad(
                      onNumberSelected:
                          context.read<SendMoneyProvider>().handleNumberInput,
                    ),
                  ),

                  // Send Button
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.04),
                    child: ElevatedButton(
                      onPressed: () {
                        if (double.parse(provider.amount.replaceAll(',', '')) >
                            0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentSuccessScreen(
                                amount: double.parse(
                                    provider.amount.replaceAll(',', '')),
                                recipientName: 'Daniel',
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        minimumSize: Size(size.width - (size.width * 0.08), 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Send \$${provider.amount}',
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
