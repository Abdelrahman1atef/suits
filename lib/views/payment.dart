import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_Image.dart';
import 'package:suits/core/widgets/app_bar.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_text.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: const CustomAppBar(
        haveTitle: true,
        haveSearchBar: false,
        title: "Payment Methods",
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            AppText(
              "Credit & Debit Card",
              style: textTheme.titleMedium?.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 26),
            Container(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: 15,
                horizontal: 20,
              ),

              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFAFAFAF)),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Row(
                    spacing: 15,
                    children: [
                      const AppImage(image: "card.png", width: 25, height: 25),
                      AppText("Add Card", style: textTheme.labelLarge),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            AppText(
              "More Payment Options",
              style: textTheme.titleMedium?.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 21),
            const _PaymentItem(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsetsDirectional.only(
          start: 24,
          end: 24,
          top: 12,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          color: color.secondary,
          border: const BorderDirectional(top: BorderSide(color: Color(0xFFB1B1B1))),
        ),
        child: const AppButton(
          text: "Confirm Payment",
          textStyle: TextStyle(fontVariations: [FontVariation("wght", 700)]),
          padding: EdgeInsetsDirectional.symmetric(vertical: 12),
          borderRadius: 10,
        ),
      ),
    );
  }
}

final paymentMethods = [
  {"title": "Paypal", "icon": "paypal.png", "type": "Paypal"},
  {"title": "Apple Pay", "icon": "apple.png", "type": "Apple"},
  {"title": "Google", "icon": "google.png", "type": "Google"},
];

class _PaymentItem extends StatefulWidget {
  const _PaymentItem();

  @override
  State<_PaymentItem> createState() => _PaymentItemState();
}

class _PaymentItemState extends State<_PaymentItem> {
  String? value = "Paypal";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFAFAFAF)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: RadioGroup(
        groupValue: value,
        onChanged: (value) {
          setState(() {
            this.value = value;
          });
        },
        child: Column(
          children: [
            for (var paymentMethod in paymentMethods) ...[
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => setState(() {
                    value = paymentMethod["type"];
                  }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 15,
                        children: [
                          AppImage(
                            image: paymentMethod["icon"]!,
                            width: 20,
                            height: 20,
                          ),
                          AppText(
                            paymentMethod["title"]!,
                            style: textTheme.labelLarge,
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 1.3,
                        child: Radio<String>(
                          value: paymentMethod["type"]!,
                          toggleable: true,
                          activeColor: theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (paymentMethods.last != paymentMethod)
                const Divider(color: Color(0xFFAFAFAF), height: 0),
            ],
          ],
        ),
      ),
    );
  }
}
