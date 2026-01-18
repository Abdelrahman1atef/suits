import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_image.dart';
import 'package:suits/core/widgets/app_input_text.dart';
import 'package:suits/views/checkout.dart';

import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_text.dart';


final cartItems = [
  CartItem(id: 1, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
  CartItem(id: 2, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
  CartItem(id: 3, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
  CartItem(id: 4, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
];

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    final checkOutTextStyle = textTheme.displayMedium?.copyWith(color: const Color(0xFF858585));
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Dismissible(
            key: ValueKey(item),
            background: Container(
              color: const Color(0xFFDB5050).withValues(alpha: 0.5),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const AppImage(image: "delete.png"),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  cartItems.remove(item);
                });
              }
            },
            confirmDismiss: (direction) async {
              return await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) => BottomSheet(
                      backgroundColor: color.secondary,
                      shape: const RoundedSuperellipseBorder(),
                      onClosing: () {},
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsetsDirectional.only(start: 13, end: 13, bottom: 50),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 31),
                              AppText(
                                "Remove from card?",
                                style: textTheme.titleMedium?.copyWith(fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Divider(),
                                  CardItem(item: item),
                                ],
                              ),
                              const SizedBox(height: 61),
                              Row(
                                spacing: 14,
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: AppButton(
                                      onPressed: () => Navigator.pop(context, false),
                                      text: "Cancel",
                                      borderRadius: 25,
                                      padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
                                      textStyle: TextStyle(color: theme.primaryColor),
                                      color: const Color(0xFFD3D3D3),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: AppButton(
                                      borderRadius: 25,
                                      onPressed: () => Navigator.pop(context, true),
                                      padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
                                      textStyle: const TextStyle(fontVariations: [FontVariation("wght", 700)]),
                                      text: "Yes,Remove",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ) ??
                  false;
            },
            direction: DismissDirection.endToStart,
            dismissThresholds: const {DismissDirection.endToStart: 0.5},
            child: CardItem(item: item),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: color.secondary,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 42, vertical: 11),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppInputText(
              hintText: "Promo Code",
              suffixIcon: Padding(
                padding: EdgeInsetsDirectional.only(end: 10),
                child: AppButton(
                  text: "Apply",
                  height: 35,
                  width: 90,
                  textStyle: TextStyle(fontSize: 14),
                  padding: EdgeInsetsDirectional.all(0),
                ),
              ),

              padding: EdgeInsetsDirectional.symmetric(vertical: 0),
              borderColor: Color(0xFFB5B5B5),
            ),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppText("Sub-Total",style: checkOutTextStyle,), const AppText("\$407.94")],
            ),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppText("Delivery Free",style: checkOutTextStyle,), const AppText("\$25.00")],
            ),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppText("Discount",style: checkOutTextStyle,), const AppText("-\$35.00")],
            ),
            const SizedBox(height: 13),
            AppText(
              "-"*100,
              style: checkOutTextStyle,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppText("Total Cost",style: checkOutTextStyle,), const AppText("\$397.94")],
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      onPressed: () =>
                          Navigator.push(context, MaterialPageRoute<void>(builder: (context) => const CheckoutView())),
                      text: "Proceed to Checkout",
                      textStyle: const TextStyle(fontVariations: [FontVariation("wght", 500)]),
                      padding: const EdgeInsetsDirectional.symmetric(),
                      borderRadius: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
