import 'package:flutter/material.dart';
import '../../domain/models/card_model.dart';

class CardSelectorSheet extends StatelessWidget {
  final List<CardModel> cards;
  final int selectedIndex;
  final Function(int) onCardSelected;

  const CardSelectorSheet({
    Key? key,
    required this.cards,
    required this.selectedIndex,
    required this.onCardSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Select Card',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(
            cards.length,
            (index) => ListTile(
              leading: Image.network(
                cards[index].cardTypeIcon,
                height: 30,
              ),
              title: Text(
                '**** ${cards[index].cardNumber.substring(cards[index].cardNumber.length - 4)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Balance: \$${cards[index].balance}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              trailing: selectedIndex == index
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : null,
              onTap: () {
                onCardSelected(index);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
