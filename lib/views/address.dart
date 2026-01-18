import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../core/widgets/app_Image.dart';
import '../core/widgets/app_bar.dart';
import '../core/widgets/app_button.dart';
import '../core/widgets/app_text.dart';

class _AddressItem {
  final String title;
  final String address;

  _AddressItem({required this.title, required this.address});
}

final _addressItems = [
  _AddressItem(title: "Home", address: "Dakahlia, Mansoura, Al-Gamaa District,Al-Sabahi Street"),
  _AddressItem(title: "Office", address: "Dakahlia, Mansoura, Al-Gamaa District,Al-Sabahi Street"),
  _AddressItem(title: "Parent’s House", address: "Dakahlia, Mansoura, Al-Gamaa District,Al-Sabahi Street"),
  _AddressItem(title: "Frind’s House", address: "Dakahlia, Mansoura, Al-Gamaa District,Al-Sabahi Street"),
];

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: const CustomAppBar(haveTitle: true, haveSearchBar: false, title: "Shipping Adress"),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: color.secondary,
          border: const Border(top: BorderSide(color: Color(0xFFB1B1B1))),
        ),
        padding: const EdgeInsetsDirectional.only(start: 24, end: 24, top: 12, bottom: 24),
        child: AppButton(onPressed: () => Navigator.pop(context), text: "Apply", borderRadius: 18),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 17),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                for (final item in _addressItems) ...[
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            const AppImage(image: "location.png", height: 18, width: 18),
                            AppText(item.title, style: textTheme.headlineLarge?.copyWith(fontSize: 22)),
                          ],
                        ),
                        const SizedBox(height: 29),
                        AppText(
                          item.address,
                          style: textTheme.headlineLarge?.copyWith(
                            fontSize: 20,
                            color: const Color(0xFF727272),
                            fontVariations: [const FontVariation("wght", 600)],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_addressItems.last != item) const Divider(height: 0, color: Color(0xFFB5B5B5)),
                ],
              ],
            ),
            const SizedBox(height: 29),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => const AddressView())),
                    child: Container(
                      decoration: BoxDecoration(color: color.secondary, borderRadius: BorderRadius.circular(10)),
                      child: DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          radius: const Radius.circular(10),
                          dashPattern: [5, 5],
                          color: theme.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          strokeWidth: 1,
                          borderPadding: const EdgeInsets.all(0),
                          strokeCap: StrokeCap.square,
                        ),
                        child: Center(
                          child: AppText(
                            "+ Add New Shipping Address",
                            textAlign: TextAlign.center,
                            style: textTheme.labelMedium?.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
