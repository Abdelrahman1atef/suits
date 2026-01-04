import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_otp.dart';
import 'package:suits/views/create_password.dart';

import '../core/widgets/app_bar.dart';
import '../core/widgets/app_text.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
            const Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 50),
              child: AppOtp(length: 4),
            ),
            const SizedBox(height: 31),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const CreatePasswordView(),
                      ),
                    ),
                    text: "Verify",
                    padding: const EdgeInsetsDirectional.symmetric(vertical: 25),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  //todo add send again action
                  onTap: () => {},
                  child: RichText(
                    text: TextSpan(
                      style: theme.textTheme.labelMedium,
                      children: [
                        TextSpan(
                          text: "Didn’t receive the code?",
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.onTertiary,
                            fontVariations: [const FontVariation("wght", 400)],
                          ),
                        ),
                        TextSpan(
                          text: "Resend",
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontVariations: [const FontVariation("wght", 400)],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
