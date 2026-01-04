import 'package:flutter/material.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
     this.onPressed,
    this.icon,
    this.color,
    this.isChildIcon,
    this.borderRadius,
    this.padding,
    this.isGradientColored,
    this.shape,
    this.text,
    this.margin, this.textStyle, this.widget,
  });

  final void Function()? onPressed;
  final Widget? icon,widget;
  final Color? color;
  final bool? isChildIcon;
  final double? borderRadius;
  final EdgeInsetsDirectional? margin, padding;
  final bool? isGradientColored;
  final OutlinedBorder? shape;
  final String? text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double borderRadius=32;
    return Container(
      height: isChildIcon ?? false ? 60 : null,
      width: isChildIcon ?? false ? 60 : null,
      margin: margin ?? const EdgeInsetsDirectional.all(0),
      decoration: BoxDecoration(
        color: isGradientColored ?? false
            ? Colors.transparent
            : color ?? theme.primaryColor,
        borderRadius: BorderRadiusGeometry.circular(this.borderRadius ?? borderRadius),
        gradient: isGradientColored ?? false
            ? LinearGradient(
                colors: [
                  ColorScheme.of(context).secondaryContainer,
                  ColorScheme.of(context).primaryContainer,
                ],
              )
            : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          padding: WidgetStatePropertyAll(
            padding ?? const EdgeInsetsDirectional.symmetric(vertical: 25,horizontal: 18) ,
          ),
          elevation: const WidgetStatePropertyAll(0),
          alignment: AlignmentGeometry.center,
          shape: WidgetStatePropertyAll(
            isChildIcon ?? false
                ? RoundedSuperellipseBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  )
                : shape ??
                      RoundedSuperellipseBorder(
                        borderRadius: BorderRadiusGeometry.circular(borderRadius),
                      ),
          ),
        ),
        child: isChildIcon ?? false
            ? icon
            :text!=null? AppText(
                text ?? "",
                style: textStyle ??Theme.of(context).textTheme.bodyMedium,
              ):widget,
      ),
    );
  }
}
