import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_Image.dart';
import 'package:suits/core/widgets/app_bar.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_input_text.dart';
import 'package:suits/core/widgets/app_text.dart';
import 'package:suits/views/otp.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

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
            AppText("Forgot Your Password?", style: theme.textTheme.titleLarge),
            AppText(
              "Enter your email or your phone number, we will send you confirmation code",
              style: theme.textTheme.labelLarge?.copyWith(fontSize: 18),
            ),
            AppToggleButton(),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: "Reset Password",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(builder: (context) => const OtpView()),
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

class AppToggleButton extends StatefulWidget {
  const AppToggleButton({super.key});

  @override
  State<AppToggleButton> createState() => _AppToggleButtonState();
}

class _AppToggleButtonState extends State<AppToggleButton> {
  bool isEmail = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsetsDirectional.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: theme.colorScheme.outline, width: 1),
          ),
          alignment: AlignmentGeometry.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  isEmail = true;
                }),
                child: Container(
                  alignment: AlignmentGeometry.center,
                  padding: const EdgeInsetsGeometry.symmetric(
                    horizontal: 50,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isEmail ? Color(0xFFF9FAFB) : null,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AppText(
                    "Email",
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: 16,
                      color: isEmail ? theme.primaryColor : theme.hintColor,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  isEmail = false;
                }),
                child: Container(
                  alignment: AlignmentGeometry.center,
                  padding: const EdgeInsetsGeometry.symmetric(
                    horizontal: 50,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: !isEmail ? Color(0xFFF9FAFB) : null,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AppText(
                    "Phone",
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: 16,
                      color: !isEmail ? theme.primaryColor : theme.hintColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AppInputText(
          hintText: isEmail ? "Enter your email" : "Enter your phone number",
          icon: isEmail
              ? AppImage(image: "unfiled_email.png")
              : AppImage(image: "filled_phone.png"),
        ),
      ],
    );
  }
}
