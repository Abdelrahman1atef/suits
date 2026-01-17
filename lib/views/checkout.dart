import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_bar.dart';
import 'package:suits/core/widgets/app_text.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: CustomAppBar(haveTitle: true, haveSearchBar: false, title: "Chekout"),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 17),
        child: Column(
          children: [
            SizedBox(height: 39),
            AppText("Shipping Address", style: textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}
