part of '../home.dart';

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({required this.title, required this.hasSeeAll});

  final String title;
  final bool hasSeeAll;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontFamily: "Montserrat",
            fontSize: 25,
            fontVariations: [const FontVariation("wght", 700)],
          ),
        ),
        //todo add see all section
        if (hasSeeAll)
          AppText(
            "See All",
            style: textTheme.labelSmall?.copyWith(
              color: const Color(0xFF4E6542),
            ),
          ),
      ],
    );
  }
}
