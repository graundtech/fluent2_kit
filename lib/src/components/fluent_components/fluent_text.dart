import 'package:flutter/material.dart';
import 'package:fluent2_kit/src/fluent_models/fluent_text_style.dart';
import 'package:fluent2_kit/src/fluent_with_material/mixed_fluent_text_style.dart';

class FluentText extends StatelessWidget {
  final String data;
  final FluentTextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextHeightBehavior? textHeightBehavior;
  final Locale? locale;
  final bool? softWrap;
  final TextScaler? textScaler;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final Color? selectionColor;
  final StrutStyle? strutStyle;

  /// FluentText's constructor
  FluentText(
    this.data, {
    this.style,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.textOverflow,
    this.textHeightBehavior,
    this.textWidthBasis,
    this.semanticsLabel,
    this.softWrap,
    this.selectionColor,
    this.locale,
    @Deprecated(
      'Use textScaler instead. '
      'Use of textScaleFactor was deprecated in preparation for the upcoming nonlinear text scaling support. '
      'This feature was deprecated after v3.12.0-2.0.pre.',
    )
    double? textScaleFactor,
    TextScaler? textScaler,
    this.strutStyle,
  }) : textScaler = textScaler ??
            (textScaleFactor == null
                ? null
                : TextScaler.linear(textScaleFactor));

  @override
  Widget build(BuildContext context) {
    final style = this.style;
    return Text(
      data,
      style: style as MixedFluentTextStyle?,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: textOverflow,
      textHeightBehavior: textHeightBehavior,
      locale: locale,
      selectionColor: selectionColor,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textScaler: textScaler,
      strutStyle: strutStyle,
    );
  }
}
