import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_Image.dart';
import 'package:suits/core/widgets/app_text.dart';
import 'package:suits/views/home/view.dart';

import '../core/widgets/app_bar.dart';
import '../core/widgets/app_button.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: const CustomAppBar(haveTitle: true, haveSearchBar: false, title: "Payment"),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: color.secondary,
          border: const Border(top: BorderSide(color: Color(0xFFB1B1B1))),
        ),
        padding: const EdgeInsetsDirectional.only(start: 24, end: 24, top: 12, bottom: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Row(
              children: [
                Expanded(child: AppButton(onPressed: () => const HomeView(), text: "View Order", borderRadius: 18)),
              ],
            ),
            AppText("View E-Receipt",style: TextStyle(color: theme.primaryColor),)
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppImage(image: "pay_success.png", height: 130, width: 130),
            const SizedBox(height: 35,),
            AppText(
              "Payment Successful!",
              style: textTheme.bodySmall?.copyWith(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15,),
            AppText(
              "Thank you for your purchase.",
              style: textTheme.bodySmall?.copyWith(color: const Color(0xFF858585), fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
