part of '../home.dart';


class _Category extends StatelessWidget {
  const _Category({required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: theme.primaryColor),
          ),
          child: AppImage(
            image: icon,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 55,
          child: AppText(
            text,
            maxLines: 1,
            textAlign: TextAlign.center,
            softWrap: true,
            style: textTheme.titleMedium?.copyWith(
              fontFamily: "Montserrat",
              color: const Color(0xFF676767),
              fontSize: 15,
              fontVariations: const [FontVariation("wght", 700)],
            ),
          ),
        ),
      ],
    );
  }
}
