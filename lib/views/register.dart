import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_bar.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_input_text.dart';
import 'package:suits/views/login.dart';

import '../core/widgets/app_Image.dart';
import '../core/widgets/app_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        haveTitle: true,
        haveSearchBar: false,
        title: "Sign Up",
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 17),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const AppInputText(
              hintText: "Enter your name",
              icon: AppImage(image: "unfilled_user.png"),
            ),
            const SizedBox(height: 16),
            const AppInputText(
              hintText: "Enter your email",
              icon: AppImage(image: "unfiled_email.png"),
            ),
            const SizedBox(height: 16),
            const AppInputText(
              hintText: "Enter your password",
              isPasswordField: true,
              icon: AppImage(image: "unfiled_password.png"),
            ),
            const SizedBox(height: 16),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _CheckBoxWidget(),
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.tertiary,
                    ),
                    children: [
                      const TextSpan(text: "I agree to the medidoc "),
                      TextSpan(
                        text: "Terms of Service\n",
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                      const TextSpan(text: "and "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 38),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: theme.scaffoldBackgroundColor,
                          title: Container(
                            height: 150,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF5F8FF),
                            ),
                            child: const AppImage(
                              image: "check_big.png",
                              height: 32,
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText(
                                "Success",
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontSize: 25,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              AppText(
                                "Your account has been successfully registered",
                                textAlign: TextAlign.center,
                                style: theme.textTheme.labelLarge?.copyWith(),
                              ),
                            ],
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppButton(
                                  text: "Sign In",
                                  padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 47,
                                    vertical: 21,
                                  ),
                                  onPressed: () => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (context) => const LoginView(),
                                    ),
                                    (route) => false,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    text: "Sign Up",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const LoginView(),
                ),
              ),
              child: RichText(
                text: TextSpan(
                  style: theme.textTheme.labelMedium,
                  children: [
                    TextSpan(
                      text: "Have an account? ",
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onTertiary,
                        fontVariations: [const FontVariation("wght", 400)],
                      ),
                    ),
                    TextSpan(
                      text: "Sign In",
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
      ),
    );
  }
}

class _CheckBoxWidget extends StatefulWidget {
  const _CheckBoxWidget();

  @override
  State<_CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<_CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Checkbox(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        },
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        side: const BorderSide(color: Color(0xFFD9D9D9)),
        focusColor: Colors.green,
        activeColor: Colors.green,
        splashRadius: 15,
      ),
    );
  }
}
