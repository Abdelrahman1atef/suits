import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_Image.dart';
import 'package:suits/core/widgets/app_bar.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_input_text.dart';
import 'package:suits/views/home/view.dart';
import 'package:suits/views/register.dart';

import '../core/widgets/app_text.dart';
import 'forget_password.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const CustomAppBar(
        haveTitle: true,
        haveSearchBar: false,
        title: "Login",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 15),
            AppText(
              "Hi Welcome back, you’ve been missed",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 17),
              child: Column(
                children: [
                  const Form(
                    child: Column(
                      spacing: 16,
                      children: [
                        AppInputText(
                          hintText: "Enter your email",
                          icon: AppImage(image: "unfiled_email.png"),
                        ),
                        AppInputText(
                          hintText: "Enter your password",
                          isPasswordField: true,
                          icon: AppImage(image: "unfiled_password.png"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => const ForgetPasswordView(),
                          ),
                        ),
                        child: AppText(
                          "Forgot Password?",
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                                      "Yeay! Welcome Back",
                                      style: theme.textTheme.titleLarge
                                          ?.copyWith(fontSize: 25),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    AppText(
                                      "Once again you login successfully into medidoc app",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.labelLarge
                                          ?.copyWith(),
                                    ),
                                  ],
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppButton(
                                        text: "Go to home",
                                        padding:
                                            const EdgeInsetsDirectional.symmetric(
                                              horizontal: 47,
                                              vertical: 21,
                                            ),
                                        onPressed: () =>
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder: (context) =>
                                                    const HomeView(),
                                              ),
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          text: "Sign In",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const RegisterView(),
                      ),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: theme.textTheme.labelMedium,
                        children: [
                          TextSpan(
                            text: "Don’t have an account? ",
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onTertiary,
                              fontVariations: [
                                const FontVariation("wght", 400),
                              ],
                            ),
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontVariations: [
                                const FontVariation("wght", 400),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 33),
                  Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      const Divider(),
                      AppText(
                        "OR",
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 42),
                  const SocialButton(
                    image: 'google.png',
                    text: 'Sign in with google',
                  ),
                  const SocialButton(
                    image: 'apple.png',
                    text: 'Sign in with Apple',
                  ),
                  const SocialButton(
                    image: 'facebook.png',
                    text: 'Sign in with Facebook',
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

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsGeometry.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              onPressed: () {},
              color: theme.colorScheme.secondary,
              shape: RoundedSuperellipseBorder(
                side: BorderSide(color: theme.colorScheme.outline),
                borderRadius: BorderRadiusGeometry.circular(32),
              ),
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: 25,
                horizontal: 18,
              ),
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppImage(image: image),
                  AppText(text, textAlign: TextAlign.center),
                  const SizedBox(width: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
