import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/animations/animated_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/wallet_provider.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final double amount;
  final String recipientName;

  const PaymentSuccessScreen({
    Key? key,
    required this.amount,
    required this.recipientName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Deduct the amount when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WalletProvider>().deductAmount(amount);
    });

    final size = MediaQuery.of(context).size;

    return AnimatedPage(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.04),
            child: Column(
              children: [
                const Spacer(),
                // Success Animation
                Container(
                  width: size.width * 0.5,
                  height: size.width * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_s2lryxtd.json',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: size.height * 0.04),

                // Success Text
                Text(
                  'Payment Successful!',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                // Amount
                Text(
                  '\$$amount',
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                // Recipient info
                Text(
                  'has been sent to',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  recipientName,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),

                // Done Button
                ElevatedButton(
                  onPressed: () {
                    // Pop twice to go back to home screen
                    Navigator.of(context)
                      ..pop()
                      ..pop();
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
                    'Done',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
