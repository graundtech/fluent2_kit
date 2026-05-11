import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluent2ui/fluent2ui.dart';
import 'package:fluent2ui/src/components/fluent_components/fluent_text_field/text_field_trailing_icon.dart';

part 'fluent_text_field_controller.dart';

class FluentTextField extends StatefulWidget {
  final FluentTextFieldController? controller;
  final String? hintText;
  final String? label;
  final String? assistiveText;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final void Function(String value)? onChanged;
  final bool readOnly;
  final bool hasError;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final TextAlign textAlign;
  final int? maxLines;
  final bool autofocus;
  final bool autocorrect;
  final Clip clipBehavior;
  final Widget? Function(
    BuildContext, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  })? buildCounter;
  final Color? cursorErrorColor;
  final bool canRequestFocus;
  final double? cursorHeight;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final bool enableSuggestions;
  final int? maxLength;
  final bool expands;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final void Function()? onEditingComplete;
  final String obscuringCharacter;
  final void Function(String)? onSubmitted;
  final ScrollController? scrollController;

  const FluentTextField({
    super.key,
    this.controller,
    this.hintText,
    this.assistiveText,
    this.errorText,
    this.label,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
    this.onChanged,
    this.readOnly = false,
    this.hasError = false,
    this.obscureText = false,
    this.keyboardType,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.autofocus = false,
    this.autocorrect = true,
    this.clipBehavior = Clip.hardEdge,
    this.buildCounter,
    this.cursorErrorColor,
    this.canRequestFocus = true,
    this.cursorHeight,
    this.enabled,
    this.inputFormatters,
    this.enableSuggestions = true,
    this.maxLength,
    this.expands = false,
    this.magnifierConfiguration,
    this.onEditingComplete,
    this.obscuringCharacter = '•',
    this.onSubmitted,
    this.scrollController,
  });

  @override
  State<FluentTextField> createState() => _FluentTextFieldState();
}

class _FluentTextFieldState extends State<FluentTextField> {
  late final FluentTextFieldController fluentTextFieldController;

  @override
  void initState() {
    super.initState();
    fluentTextFieldController =
        widget.controller ?? _InternalFluentTextFieldController();
  }

  @override
  void dispose() {
    if (fluentTextFieldController is _InternalFluentTextFieldController) {
      fluentTextFieldController.dispose();
    } else {
      // fluentTextFieldController.removeListener(controllerListener);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final fluentTheme = FluentThemeDataModel.of(context) as GbtFluentThemeData;
    final hintText = widget.hintText;
    final assistiveText = widget.assistiveText;
    final errorText = widget.errorText;
    final label = widget.label;
    final suffixIcon = widget.suffixIcon;
    final prefixIcon = widget.prefixIcon;
    final prefix = widget.prefix;
    final onChanged = widget.onChanged;
    final keyboardType = widget.keyboardType;
    final onTap = widget.onTap;
    final textAlign = widget.textAlign;
    final maxLines = widget.maxLines;
    final autofocus = widget.autofocus;
    final autocorrect = widget.autocorrect;
    final clipBehavior = widget.clipBehavior;
    final buildCounter = widget.buildCounter;
    final cursorErrorColor = widget.cursorErrorColor;
    final canRequestFocus = widget.canRequestFocus;
    final cursorHeight = widget.cursorHeight;
    final enabled = widget.enabled;
    final inputFormatters = widget.inputFormatters;
    final enableSuggestions = widget.enableSuggestions;
    final maxLength = widget.maxLength;
    final expands = widget.expands;
    final magnifierConfiguration = widget.magnifierConfiguration;
    final onEditingComplete = widget.onEditingComplete;
    final obscuringCharacter = widget.obscuringCharacter;
    final onSubmitted = widget.onSubmitted;
    final scrollController = widget.scrollController;

    return ListenableBuilder(
      listenable: Listenable.merge([
        fluentTextFieldController.hasFocus,
        fluentTextFieldController.textEditingController,
      ]),
      builder: (context, child) {
        final isNotEmpty = fluentTextFieldController
            .textEditingController.value.text.isNotEmpty;
        final hasFocus = fluentTextFieldController.hasFocus;

        return Row(
          children: [
            if (prefixIcon != null) ...[
              SizedBox(
                width: FluentSize.size160.value,
              ),
              prefixIcon is Icon
                  ? IconTheme(
                      data: IconThemeData(
                        size: FluentSize.size240.value,
                        color: hasFocus.value
                            ? FluentColors.of(context)?.brandForeground1Rest
                            : colorMode(
                                FluentColors.neutralForeground2Rest,
                                FluentDarkColors.neutralForeground2Rest,
                              ),
                      ),
                      child: prefixIcon)
                  : prefixIcon
            ],
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: label == null ? 0 : FluentSize.size240.value,
                  left: FluentSize.size160.value,
                ),
                child: TextField(
                  keyboardType: keyboardType,
                  onTap: onTap,
                  textAlign: textAlign,
                  maxLines: maxLines,
                  autofocus: autofocus,
                  autocorrect: autocorrect,
                  clipBehavior: clipBehavior,
                  buildCounter: buildCounter,
                  obscureText: widget.obscureText,
                  cursorErrorColor: cursorErrorColor,
                  canRequestFocus: canRequestFocus,
                  cursorHeight: cursorHeight,
                  enabled: enabled,
                  inputFormatters: inputFormatters,
                  enableSuggestions: enableSuggestions,
                  maxLength: maxLength,
                  expands: expands,
                  magnifierConfiguration: magnifierConfiguration,
                  onEditingComplete: onEditingComplete,
                  obscuringCharacter: obscuringCharacter,
                  onSubmitted: onSubmitted,
                  scrollController: scrollController,
                  readOnly: widget.readOnly,
                  focusNode: fluentTextFieldController._focus,
                  onTapOutside: (event) {
                    fluentTextFieldController._focus.unfocus();
                  },
                  controller: fluentTextFieldController.textEditingController,
                  onChanged: onChanged,
                  cursorColor: colorMode(
                    FluentColors.neutralForeground3Rest,
                    FluentDarkColors.neutralForeground3Rest,
                  ),
                  style: fluentTheme.fluentTextTheme?.body1?.fluentCopyWith(
                    fluentColor: hasFocus.value
                        ? colorMode(
                            FluentColors.neutralForeground1Rest,
                            FluentDarkColors.neutralForeground1Rest,
                          )
                        : colorMode(
                            FluentColors.neutralForeground2Rest,
                            FluentDarkColors.neutralForeground2Rest,
                          ),
                  ),
                  decoration: InputDecoration(
                    label: label != null
                        ? Transform.translate(
                            offset: Offset(0, -12),
                            child: Transform.scale(
                              scale: 1 / .75,
                              alignment: Alignment.centerLeft,
                              child: FluentText(label),
                            ),
                          )
                        : SizedBox.shrink(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle:
                        fluentTheme.fluentTextTheme?.caption2?.fluentCopyWith(
                      fluentColor: widget.hasError
                          ? colorMode(
                              FluentColors.statusDangerForeground2Rest,
                              FluentDarkColors.statusDangerForeground2Rest,
                            )
                          : hasFocus.value
                              ? fluentTheme.colorScheme.primary
                              : colorMode(
                                  FluentColors.neutralForeground2Rest,
                                  FluentDarkColors.neutralForeground2Rest,
                                ),
                    ),
                    contentPadding: EdgeInsets.only(
                      right: FluentSize.size160.value,
                      bottom: 13
                    ),
                    hintText: hintText,
                    helperText: assistiveText,
                    error: errorText != null
                        ? FluentText(
                            errorText,
                            textAlign: TextAlign.start,
                            style: FluentThemeDataModel.of(context)
                                .fluentTextTheme
                                ?.caption2
                                ?.fluentCopyWith(
                                  fluentColor:
                                      colorMode(
                                          FluentColors.statusDangerForeground2Rest,
                                          FluentDarkColors.statusDangerForeground2Rest,
                                      ),
                                ),
                          )
                        : null,
                    helperStyle:
                        fluentTheme.fluentTextTheme?.caption2?.fluentCopyWith(
                      fluentColor: widget.hasError
                          ? colorMode(
                              FluentColors.statusDangerForeground2Rest,
                              FluentDarkColors.statusDangerForeground2Rest,
                            )
                          : colorMode(
                              FluentColors.neutralForeground2Rest,
                              FluentDarkColors.neutralForeground2Rest,
                            ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.hasError
                            ? colorMode(
                                FluentColors.statusDangerForeground2Rest,
                                FluentDarkColors.statusDangerForeground2Rest,
                              )
                            : colorMode(
                                FluentColors.neutralStroke1Rest,
                                FluentDarkColors.neutralStroke1Rest,
                              ),
                        width: FluentStrokeThickness.strokeWidth05.value,
                      ),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: FluentStrokeThickness.strokeWidth05.value,
                        color: colorMode(
                          FluentColors.neutralStroke1Rest,
                          FluentDarkColors.neutralStroke1Rest,
                        ),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: FluentStrokeThickness.strokeWidth05.value,
                        color: widget.hasError
                            ? colorMode(
                                FluentColors.statusDangerForeground2Rest,
                                FluentDarkColors.statusDangerForeground2Rest,
                              )
                            : FluentColors.of(context)?.brandStroke1Rest ??
                                // ❕ Never reached fallback
                                Theme.of(context).primaryColor,
                      ),
                    ),
                    hintStyle:
                        fluentTheme.fluentTextTheme?.body1?.fluentCopyWith(
                      fluentColor: enabled == false
                          ? colorMode(
                              FluentColors.neutralForegroundDisabled1Rest,
                              FluentDarkColors.neutralForegroundDisabled1Rest,
                            )
                          : colorMode(
                              FluentColors.neutralForeground2Rest,
                              FluentDarkColors.neutralForeground2Rest,
                            ),
                    ),
                    prefix: prefix,
                    suffixIcon: widget.readOnly
                        ? null
                        : TextFieldTrailingIcon(
                            hasFocus: hasFocus.value,
                            isNotEmpty: isNotEmpty,
                            suffixIcon: suffixIcon,
                            onTapCancelIcon: () {
                              fluentTextFieldController.textEditingController
                                  .value = TextEditingValue(text: "");
                            },
                          ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class _InternalFluentTextFieldController extends FluentTextFieldController {}
