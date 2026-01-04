import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../core/widgets/app_bar.dart';
import '../core/widgets/app_text.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor.withValues(alpha: 0.8),
      appBar: const CustomAppBar(haveTitle: false, haveSearchBar: false),
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            AppText(
              "Enter Verification Code",
              style: theme.textTheme.titleLarge,
            ),

            RichText(
              text: TextSpan(
                style: theme.textTheme.labelLarge?.copyWith(fontSize: 18),
                children: const [
                  TextSpan(
                    text: "Enter code that we have sent to your number ",
                  ),
                  TextSpan(
                    text: "08528188*** ",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 33),
            PinCodeTextField(
              appContext: context,
              length: 4,
              animationType: AnimationType.fade,
              hintCharacter: "-",
              hintStyle: TextStyle(fontSize: 25,),
              textStyle: theme.textTheme.titleLarge,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(16),
                fieldHeight: 64,
                fieldWidth: 64,
                borderWidth: 1.5,
                errorBorderColor: theme.colorScheme.error,
                activeColor: theme.primaryColor,
                inactiveColor: theme.scaffoldBackgroundColor,
                selectedColor: theme.primaryColor,
                inactiveBorderWidth: 0,

                activeFillColor: theme.colorScheme.secondary,
                inactiveFillColor: theme.colorScheme.secondary,
                selectedFillColor: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
