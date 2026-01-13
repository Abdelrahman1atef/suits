import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_Image.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_input_text.dart';

import '../core/widgets/app_bar.dart';
import '../core/widgets/app_text.dart';
import 'login.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

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
            const SizedBox(height: 30),
            AppText("Create New Password", style: theme.textTheme.titleLarge),
            AppText(
              "Create your new password to login",
              style: theme.textTheme.labelLarge?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 24),
            const AppInputText(
              hintText: "Enter your password",
              isPasswordField: true,
              icon: AppImage(image: "unfiled_password.png"),
            ),
            const SizedBox(height: 11),
            const AppInputText(
              hintText: "Confirem your password",
              icon: AppImage(image: "unfiled_password.png"),
              isPasswordField: true,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: "Create Password",
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
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
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

