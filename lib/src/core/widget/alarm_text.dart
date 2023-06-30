import 'package:flutter/material.dart';

enum AlarmTypography {
  clock(true, 90),
  hour(true, 48),
  title(true, 24),
  body(false, 16);

  final bool isBold;
  final double size;
  const AlarmTypography(this.isBold, this.size);
}

class AlarmText extends StatelessWidget {
  final String text;
  final AlarmTypography typography;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  const AlarmText({
    super.key,
    required this.text,
    this.typography = AlarmTypography.body,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: color ?? const Color(0xff412234),
            fontSize: typography.size,
            fontWeight: typography.isBold ? FontWeight.w600 : FontWeight.normal,
          ),
    );
  }
}
