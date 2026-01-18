import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_Image.dart';
import 'package:suits/core/widgets/app_bar.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_text.dart';

import '../core/widgets/app_card.dart';
import 'add_card/add_card.dart';
import 'address.dart';

final cartItems = [
  CartItem(id: 1, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
  CartItem(id: 2, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
  CartItem(id: 3, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
  CartItem(id: 4, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
];

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: const CustomAppBar(haveTitle: true, haveSearchBar: false, title: "Chekout"),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 39),
            AppText("Shipping Address", style: textTheme.headlineLarge),
            const SizedBox(height: 28),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => const AddressView())),
              child: Column(
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      const AppImage(image: "location.png", height: 18, width: 18),
                      AppText("Home", style: textTheme.headlineLarge?.copyWith(fontSize: 20)),
                    ],
                  ),
                  const SizedBox(height: 29),
                  AppText(
                    "Dakahlia, Mansoura, Al-Gamaa District,Al-Sabahi Street",
                    style: textTheme.headlineLarge?.copyWith(
                      fontSize: 20,
                      color: const Color(0xFF727272),
                      fontVariations: [const FontVariation("wght", 600)],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            AppText("Order List", style: textTheme.headlineLarge),
            ListView.builder(
              itemCount: cartItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CardItem(item: item);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: color.secondary,
          border: const Border(top: BorderSide(color: Color(0xFFB1B1B1))),
        ),
        padding: const EdgeInsetsDirectional.only(start: 24, end: 24, top: 12, bottom: 24),
        child: AppButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => const AddCardView())),
          text: "Continue to payment",
          borderRadius: 18,
        ),
      ),
    );
  }
}
