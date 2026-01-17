import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_Image.dart';
import 'package:suits/core/widgets/app_filter_selector.dart';
import 'package:suits/core/widgets/app_text.dart';

final List<String> _filter = ["All", "Blazar", "Shirt", "Pant", "Shoes"];

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      children: [
        const SizedBox(height: 28),
        SizedBox(height: 30, child: FilterSelector(filter: _filter)),
        const SizedBox(height: 32),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 19),
            itemCount: _favItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.95,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final item = _favItems[index];
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AppImage(
                          image: item["image"],
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            item["name"],
                            style: textTheme.titleMedium?.copyWith(
                              fontVariations: [
                                const FontVariation("wght", 500),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const AppImage(image: "star.png", width: 15),
                              const SizedBox(width: 5),
                              AppText(
                                item["rate"].toString(),
                                style: textTheme.titleMedium?.copyWith(
                                  color: const Color(0xFF979696),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      AppText(
                        "\$${item["price"]}".toString(),
                        style: textTheme.titleMedium?.copyWith(
                          color: const Color(0xFFAB94A6),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const Positioned(
                    right: 13,
                    top: 9,
                    child: AppImage(image: "fav_item.png"),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

final List<dynamic> _favItems = [
  {
    "image": "onboarding2.jpg",
    "name": "Classic Blazar",
    "rate": 4.5,
    "price": 83.97,
  },
  {
    "image": "onboarding2.jpg",
    "name": "Classic Blazar",
    "rate": 4.5,
    "price": 83.97,
  },
  {
    "image": "onboarding2.jpg",
    "name": "Classic Blazar",
    "rate": 4.5,
    "price": 83.97,
  },
  {
    "image": "onboarding2.jpg",
    "name": "Classic Blazar",
    "rate": 4.5,
    "price": 83.97,
  },
  {
    "image": "onboarding2.jpg",
    "name": "Classic Blazar",
    "rate": 4.5,
    "price": 83.97,
  },
  {
    "image": "onboarding2.jpg",
    "name": "Classic Blazar",
    "rate": 4.5,
    "price": 83.97,
  },
  {
    "image": "onboarding2.jpg",
    "name": "Classic Blazar",
    "rate": 4.5,
    "price": 83.97,
  },
];
