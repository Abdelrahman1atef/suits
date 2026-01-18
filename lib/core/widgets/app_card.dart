import 'package:flutter/material.dart';

import 'app_button.dart';
import 'app_image.dart';
import 'app_text.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    //
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsetsGeometry.all(10),
        width: 180,
        height: 240,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadiusGeometry.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Center(child: AppImage(image: image, fit: BoxFit.cover,height: 200,width: 200,)),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsetsGeometry.all(8),
                    margin: const EdgeInsetsGeometry.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    // child: const AppImage(image: "add_to_cart.svg")
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Product Name",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 10),
            Text(
              "\$44.99",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontVariations: <FontVariation>[
                  const FontVariation('wght', 700),
                ],
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class CartItem {
  final int id;
  final String image;
  final String name;
  final String size;
  final double price;
  final int count;

  CartItem({
    required this.image,
    required this.name,
    required this.size,
    required this.price,
    required this.count,
    required this.id,
  });
}
class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AppImage(image: item.image, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [AppText(item.name), AppText("Size:${item.size}"), AppText("\$${item.price}")],
            ),
          ),
          Expanded(child: Counter(count: item.count)),
        ],
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key, required this.count});

  final int count;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;

  @override
  void initState() {
    count = widget.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    return Row(
      spacing: 9,
      children: [
        AppButton(
          width: 30,
          height: 30,
          icon: const AppText("-", style: TextStyle(fontSize: 25)),
          isChildIcon: true,
          margin: const EdgeInsetsDirectional.all(0),
          padding: const EdgeInsetsDirectional.all(0),
          borderRadius: 5,
          color: color.secondary,
          onPressed: () => setState(() {
            if (count > 1) {
              count--;
            }
          }),
        ),
        AppText(count.toString()),
        AppButton(
          width: 30,
          height: 30,
          icon: AppText("+", style: TextStyle(fontSize: 25, color: color.onPrimary)),
          margin: const EdgeInsetsDirectional.all(0),
          padding: const EdgeInsetsDirectional.all(0),
          borderRadius: 5,
          isChildIcon: true,
          onPressed: () => setState(() {
            count++;
          }),
        ),
      ],
    );
  }
}
