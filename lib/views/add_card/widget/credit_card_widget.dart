import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCardWidget extends StatefulWidget {
  const CustomCreditCardWidget({
    super.key,
    required this.nameOnCardController,
    required this.cardNumberController,
    required this.expController,
    required this.cvvController,
    this.showBackView = false,
  });

  final TextEditingController nameOnCardController;
  final TextEditingController cardNumberController;
  final TextEditingController expController;
  final TextEditingController cvvController;
  final bool showBackView;

  @override
  State<CustomCreditCardWidget> createState() => _CustomCreditCardWidgetState();
}

class _CustomCreditCardWidgetState extends State<CustomCreditCardWidget> {
  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: widget.cardNumberController.text,
      expiryDate: widget.expController.text,
      cardHolderName: widget.nameOnCardController.text.isEmpty
          ? "CARD HOLDER NAME"
          : widget.nameOnCardController.text.toUpperCase(),
      cvvCode: widget.cvvController.text,
      showBackView: widget.showBackView,
      onCreditCardWidgetChange: (value) {
        // Card brand detected: value.brandName
      },
      enableFloatingCard: true,
      floatingConfig: const FloatingConfig(
        isGlareEnabled: true,
        isShadowEnabled: true,
        shadowConfig: FloatingShadowConfig(),
      ),
      labelValidThru: 'VALID\nTHRU',
      obscureCardNumber: true,
      obscureInitialCardNumber: false,
      obscureCardCvv: true,
      labelCardHolder: 'CARD HOLDER',
      cardType: CardType.mastercard,
      isHolderNameVisible: true,
      height: 175,
      width: MediaQuery.of(context).size.width,
      isChipVisible: true,
      isSwipeGestureEnabled: true,
      animationDuration: const Duration(milliseconds: 1000),
      frontCardBorder: Border.all(color: Colors.grey),
      backCardBorder: Border.all(color: Colors.grey),
      padding: 16,
    );
  }
}