part of '../home.dart';

class _FilterSelector extends StatefulWidget {
  const _FilterSelector();

  @override
  State<_FilterSelector> createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<_FilterSelector> {
  String selectedItem =_filter.first;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return ListView.builder(
      itemCount: _filter.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = _filter[index];
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

class _CategoryItem {
  final String icon;
  final String text;

  _CategoryItem(this.icon, this.text);
}
