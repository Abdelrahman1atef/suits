import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_Image.dart';
import 'package:suits/core/widgets/app_text.dart';

import '../../../core/widgets/app_button.dart';
import '../../payment_methods.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 41),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(50),
              child: const AppImage(image: "profile.jpg", height: 100, width: 100, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 14),
          AppText("Safia Ayman", style: textTheme.titleMedium?.copyWith(fontSize: 22)),
          const SizedBox(height: 41),
          const _ProfileItems(),
        ],
      ),
    );
  }
}

final profileItems = [
  {"title": "Your Profile", "icon": "profile.png"},
  {"title": "My Orders", "icon": "order.png"},
  {"title": "Payment Methods", "icon": "payment.png"},
  {"title": "Wishlist", "icon": "wishlist.png"},
  {"title": "Setting", "icon": "settings.png"},
  {"title": "Log Out", "icon": "logout.png"},
];

class _ProfileItems extends StatelessWidget {
  const _ProfileItems();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Column(
      children: List.generate(profileItems.length, (index) {
        return InkWell(
          onTap: () {
            if (index == 2) {
              Navigator.push(context, MaterialPageRoute<void>(builder: (context) => const PaymentMethodsView()));
            }
            if (index == 5) {
              showDialog<bool>(
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
                          const SizedBox(height: 17),
                          const Divider(height: 0, thickness: 2, color: Color(0xFFB2B2B2),endIndent: 90,indent: 90,),
                          const SizedBox(height: 32),
                          AppText(
                            "Logout",
                            style: textTheme.titleMedium?.copyWith(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 17),
                          const Divider(height: 0, thickness: 2, color: Color(0xFFB2B2B2),endIndent: 20,indent: 20,),
                          const SizedBox(height: 32),
                          AppText(
                            "Are You Sure You want to log out?",
                            style: textTheme.titleMedium?.copyWith(color: const Color(0xFF888888),fontSize: 18),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            spacing: 14,
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: AppButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  text: "Cancel",
                                  borderRadius: 15,
                                  padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
                                  textStyle: const TextStyle(color: Color(0xFF4E6542)),
                                  color: Colors.transparent,
                                  border: Border.all(color: const Color(0xFF4E6542)),
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: AppButton(
                                  borderRadius: 15,
                                  onPressed: () => Navigator.pop(context, true),
                                  padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
                                  textStyle: const TextStyle(fontVariations: [FontVariation("wght", 700)]),
                                  text: "Yes, Logout",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 19, vertical: 10),
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 19, vertical: 17),
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.all(Radius.circular(5)),
                color: color.secondary,
              ),
              child: Row(
                spacing: 18,
                children: [
                  AppImage(image: profileItems[index]["icon"]!, width: 20, height: 20),
                  AppText(profileItems[index]["title"]!, style: textTheme.titleMedium?.copyWith(fontSize: 18)),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
