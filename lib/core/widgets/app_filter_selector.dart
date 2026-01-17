
import 'package:flutter/material.dart';

import 'app_text.dart';

class FilterSelector extends StatefulWidget {
  const FilterSelector( {super.key,required this.filter,});
  final List<String> filter ;
  @override
  State<FilterSelector> createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {
  late String selectedItem = widget.filter.first;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return ListView.builder(
      itemCount: widget.filter.length,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 17),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = widget.filter[index];
        Color selectedItemColor = theme.primaryColor;
        Color unselectedItemColor = color.secondary;
        bool isSelected = item == selectedItem;
        return GestureDetector(
          onTap: () => setState(() {
            selectedItem = item;
          }),
          child: Container(
            margin: const EdgeInsetsDirectional.only(end: 10),
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(50),
              color: isSelected
                  ? selectedItemColor
                  : unselectedItemColor,
            ),
            child: AppText(
              item,
              style: isSelected
                  ? textTheme.titleMedium?.copyWith(color: unselectedItemColor)
                  : textTheme.titleMedium,
            ),
          ),
        );
      },
    );
  }
}
