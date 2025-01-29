class CardModel {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String balance;
  final String cardType;
  final String cardTypeIcon;

  CardModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.balance,
    required this.cardType,
    required this.cardTypeIcon,
  });
}
