import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_bar.dart';

import '../core/widgets/app_Image.dart';
import '../core/widgets/app_button.dart';
import '../core/widgets/app_text.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        haveTitle: false,
        haveSearchBar: false,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            height: 900,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/onboarding2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 360,
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 23),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            "Famale Style",
                            style: textTheme.titleMedium?.copyWith(
                              fontVariations: [
                                const FontVariation("wght", 500),
                              ],
                              fontSize: 18,
                              color: const Color(0xFFA4A4A4),
                            ),
                          ),
                          Row(
                            children: [
                              const AppImage(image: "star.png"),
                              AppText(
                                "5.0",
                                style: textTheme.titleMedium?.copyWith(
                                  fontVariations: [
                                    const FontVariation("wght", 600),
                                  ],
                                  fontSize: 18,
                                  color: const Color(0xFF979696),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 13),
                      AppText(
                        "Classic Blazar",
                        style: textTheme.titleMedium?.copyWith(
                          fontSize: 22,

                          fontVariations: [const FontVariation("wght", 500)],
                        ),
                      ),
                      const SizedBox(height: 25),
                      AppText(
                        "Product Details",
                        style: textTheme.titleMedium?.copyWith(
                          fontSize: 18,

                          fontVariations: [const FontVariation("wght", 500)],
                        ),
                      ),
                      const SizedBox(height: 18),
                      AppText(
                        "cotton sweat shirt with a text point",
                        style: textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                          fontVariations: [const FontVariation("wght", 500)],
                          color: const Color(0xFF727272),
                        ),
                      ),
                      const SizedBox(height: 19),
                      Row(
                        spacing: 36,
                        children: [
                          AppText(
                            "Quality",
                            style: textTheme.titleMedium?.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          const _QualityCounter(),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 23),
                      Row(
                        spacing: 12,
                        children: [
                          AppText(
                            "Color:",
                            style: textTheme.titleMedium?.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          const _ColorPeeker(),
                        ],
                      ),
                      const SizedBox(height: 17),
                      Row(
                        spacing: 12,

                        children: [
                          AppText(
                            "Size:",
                            style: textTheme.titleMedium?.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          const _SizePeeker(),
                        ],
                      ),
                      const SizedBox(height: 100,)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: color.secondary,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 30,vertical: 12),
        child: const Row(
          spacing: 27,
          children: [
            AppImage(image: "fav-list.png"),
            Expanded(child: AppButton(text: "Add To Cart",textStyle: TextStyle(fontVariations: [FontVariation("wght", 700)]),borderRadius: 15,padding: EdgeInsetsDirectional.symmetric(vertical: 17),))
          ],
        ),
      ),
    );
  }
}

class _ColorPeeker extends StatefulWidget {
  const _ColorPeeker();

  @override
  State<_ColorPeeker> createState() => _ColorPeekerState();
}

class _ColorPeekerState extends State<_ColorPeeker> {
  final colors = [
    const Color(0xFF4E6542),
    const Color(0xFF323232),
    const Color(0xFFC11D1D),
    const Color(0xFF979696),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: List.generate(
        colors.length,
        (index) => Container(
          width: 20,
          height: 20,

          decoration: BoxDecoration(
            color: colors[index],
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _SizePeeker extends StatefulWidget {
  const _SizePeeker();

  @override
  State<_SizePeeker> createState() => _SizePeekerState();
}

class _SizePeekerState extends State<_SizePeeker> {
  final sizes = ["S", "M", "L", "XL"];

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 9,
      children: List.generate(
        sizes.length,
        (index) => Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsetsDirectional.all(1),
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9).withValues(alpha: 0.5),
            borderRadius: const BorderRadiusDirectional.all(
              Radius.circular(10),
            ),
          ),
          child: AppText(sizes[index]),
        ),
      ),
    );
  }
}

class _QualityCounter extends StatefulWidget {
  const _QualityCounter();

  @override
  State<_QualityCounter> createState() => _QualityCounterState();
}

class _QualityCounterState extends State<_QualityCounter> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Container(
      decoration: BoxDecoration(
        color: color.secondary,
        borderRadius: const BorderRadiusGeometry.all(Radius.circular(50.0)),
      ),
      child: Row(
        children: [
          AppButton(
            text: "-",
            onPressed: () => setState(() {
              if (count > 1) {
                count--;
              }
            }),
            margin: const EdgeInsetsDirectional.all(0),
            padding: const EdgeInsetsDirectional.all(0),
            color: Colors.transparent,
            textStyle: TextStyle(color: color.onSecondary),
          ),
          AppText(
            count.toString(),
            style: textTheme.titleMedium?.copyWith(fontSize: 18),
          ),
          AppButton(
            text: "+",
            onPressed: () {
              setState(() {
                count++;
              });
            },
            margin: const EdgeInsetsDirectional.all(0),
            padding: const EdgeInsetsDirectional.all(0),
            color: Colors.transparent,
            textStyle: TextStyle(color: color.onSecondary),
          ),
        ],
      ),
    );
  }
}
