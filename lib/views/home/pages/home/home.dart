import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_Image.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_text.dart';

part 'widgets/category.dart';

part 'widgets/title.dart';

part 'widgets/filter_selector.dart';

final List<String> _filter = ["All", "Newest", "Popular", "Men", "Women"];

final List<_CategoryItem> _categoryItems = [
  _CategoryItem("blazar.png", "Blazar"),
  _CategoryItem("shirt.png", "Shirt"),
  _CategoryItem("men_shoes.png", "Men Shoes"),
  _CategoryItem("women_shoes.png", "Women Shoes"),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 17),
      child: Column(
        children: [
          Container(
            color: theme.colorScheme.secondary,
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 28,
              vertical: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText("New Collection", style: textTheme.bodyLarge),
                      const SizedBox(height: 5),
                      const AppText("Discount 50% for the first transaction"),
                      const SizedBox(height: 18),
                      AppButton(
                        text: "Shop Now",
                        textStyle: textTheme.bodyMedium?.copyWith(
                          fontVariations: [const FontVariation("wght", 700)],
                        ),
                        borderRadius: 18,
                        padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 7,
                          horizontal: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: AppImage(image: "new_collection.png")),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const _TitleWidget(title: "Category", hasSeeAll: true),
          const SizedBox(height: 18),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: _categoryItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = _categoryItems[index];
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: 25),
                  child: _Category(icon: item.icon, text: item.text),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          const _TitleWidget(title: "Flash Sale", hasSeeAll: false),
          const SizedBox(height: 30, child: _FilterSelector()),
          const SizedBox(height: 30),
          const _GridItems()
        ],
      ),
    );
  }
}



class _GridItems extends StatefulWidget {
  const _GridItems();

  @override
  State<_GridItems> createState() => _GridItemsState();
}

class _GridItemsState extends State<_GridItems> {
  final List<String> _gridItems = [
    "https://i.pinimg.com/736x/45/27/47/452747615431757300a956eb3f0c34a1.jpg",
    "https://i.pinimg.com/736x/45/27/47/452747615431757300a956eb3f0c34a1.jpg",
    "https://i.pinimg.com/736x/45/27/47/452747615431757300a956eb3f0c34a1.jpg",
    "https://i.pinimg.com/736x/45/27/47/452747615431757300a956eb3f0c34a1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _gridItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 22,
        mainAxisSpacing: 22,
        childAspectRatio: 0.9,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final item = _gridItems[index];
        return SizedBox(
          width: 140,
          height: 150,
          child: AppImage(image: item, fit: BoxFit.cover),
        );
      },
    );
  }
}
