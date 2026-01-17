import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_image.dart';
import 'package:suits/core/widgets/app_input_text.dart';
import 'package:suits/views/checkout.dart';

import '../../../core/widgets/app_text.dart';

class _CartItem {
  final int id;
  final String image;
  final String name;
  final String size;
  final double price;
  final int count;

  _CartItem({
    required this.image,
    required this.name,
    required this.size,
    required this.price,
    required this.count,
    required this.id,
  });
}

final cartItems = [
  _CartItem(id: 1, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
  _CartItem(id: 2, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
  _CartItem(id: 3, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
  _CartItem(id: 4, image: "onboarding2.jpg", name: "Classic Blazar", size: "xl", price: 83.97, count: 1),
];

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 17),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Dismissible(
            key: ValueKey(item),
            background: Container(
              color: const Color(0xFFDB5050).withValues(alpha: 0.5),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const AppImage(image: "delete.png"),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  cartItems.remove(item);
                });
              }
            },
            confirmDismiss: (direction) async {
              return await showDialog<bool>(
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
                              const SizedBox(height: 31),
                              AppText(
                                "Remove from card?",
                                style: textTheme.titleMedium?.copyWith(fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Divider(),
                                  _CardItem(item: item),
                                ],
                              ),
                              SizedBox(height: 61),
                              Row(
                                spacing: 14,
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: AppButton(
                                      onPressed: () => Navigator.pop(context, false),
                                      text: "Cancel",
                                      borderRadius: 25,
                                      padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
                                      textStyle: TextStyle(color: theme.primaryColor),
                                      color: const Color(0xFFD3D3D3),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: AppButton(
                                      borderRadius: 25,
                                      onPressed: () => Navigator.pop(context, true),
                                      padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
                                      textStyle: const TextStyle(fontVariations: [FontVariation("wght", 700)]),
                                      text: "Yes,Remove",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ) ??
                  false;
            },
            direction: DismissDirection.endToStart,
            dismissThresholds: const {DismissDirection.endToStart: 0.5},
            child: _CardItem(item: item),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: color.secondary,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 42, vertical: 11),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppInputText(
              hintText: "Promo Code",
              suffixIcon: Padding(
                padding: EdgeInsetsDirectional.only(end: 10),
                child: AppButton(
                  text: "Apply",
                  height: 35,
                  width: 90,
                  textStyle: TextStyle(fontSize: 14),
                  padding: EdgeInsetsDirectional.all(0),
                ),
              ),

              padding: EdgeInsetsDirectional.symmetric(vertical: 0),
              borderColor: Color(0xFFB5B5B5),
            ),
            const SizedBox(height: 13),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppText("Sub-Total"), AppText("\$407.94")],
            ),
            const SizedBox(height: 13),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppText("Delivery Free"), AppText("\$25.00")],
            ),
            const SizedBox(height: 13),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppText("Discount"), AppText("-\$35.00")],
            ),
            const SizedBox(height: 13),
            const AppText(
              '----------------------------------------------------',
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            const SizedBox(height: 13),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppText("Total Cost"), AppText("\$397.94")],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 42),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      onPressed: () =>
                          Navigator.push(context, MaterialPageRoute<void>(builder: (context) => const CheckoutView())),
                      text: "Proceed to Checkout",
                      padding: const EdgeInsetsDirectional.symmetric(),
                      borderRadius: 15,
                    ),
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

class _CardItem extends StatelessWidget {
  const _CardItem({required this.item});

  final _CartItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppImage(image: item.image, width: 120, height: 140, fit: BoxFit.cover),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [AppText(item.name), AppText("Size:${item.size}"), AppText("\$${item.price}")],
          ),
          _Counter(count: item.count),
        ],
      ),
    );
  }
}

class _Counter extends StatefulWidget {
  const _Counter({required this.count});

  final int count;

  @override
  State<_Counter> createState() => _CounterState();
}

class _CounterState extends State<_Counter> {
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
