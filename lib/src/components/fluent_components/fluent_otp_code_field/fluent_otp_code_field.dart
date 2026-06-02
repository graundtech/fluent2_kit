import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentOtpCodeField extends StatefulWidget {
  static const int codeLength = 6;

  final FluentOtpCodeFieldController? controller;
  final int maxLength;
  final bool hasError;
  final bool enabled;
  final bool autofocus;
  final bool obscureText;
  final void Function(String value)? onChanged;
  final void Function(String value)? onCompleted;
  final Widget child;

  const FluentOtpCodeField({
    super.key,
    this.controller,
    this.maxLength = codeLength,
    this.hasError = false,
    this.enabled = true,
    this.autofocus = false,
    this.obscureText = false,
    this.onChanged,
    this.onCompleted,
    required this.child,
  }) : assert(maxLength > 0);

  @override
  State<FluentOtpCodeField> createState() => _FluentOtpCodeFieldState();
}

class _FluentOtpCodeFieldState extends State<FluentOtpCodeField> {
  late final FluentOtpCodeFieldController fluentOtpCodeFieldController;
  String? _lastCompletedValue;
  bool _isNormalizing = false;

  @override
  void initState() {
    super.initState();
    fluentOtpCodeFieldController =
        widget.controller ?? _InternalFluentOtpCodeFieldController();
    fluentOtpCodeFieldController.textEditingController.addListener(_onChanged);
    _normalizeControllerValue();
  }

  @override
  void didUpdateWidget(covariant FluentOtpCodeField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller) {
      fluentOtpCodeFieldController.textEditingController.removeListener(
        _onChanged,
      );
      if (fluentOtpCodeFieldController
          is _InternalFluentOtpCodeFieldController) {
        fluentOtpCodeFieldController.dispose();
      }
      fluentOtpCodeFieldController =
          widget.controller ?? _InternalFluentOtpCodeFieldController();
      fluentOtpCodeFieldController.textEditingController.addListener(
        _onChanged,
      );
    }

    if (widget.maxLength != oldWidget.maxLength) {
      _normalizeControllerValue();
    }
  }

  @override
  void dispose() {
    fluentOtpCodeFieldController.textEditingController.removeListener(
      _onChanged,
    );
    if (fluentOtpCodeFieldController is _InternalFluentOtpCodeFieldController) {
      fluentOtpCodeFieldController.dispose();
    }
    super.dispose();
  }

  void _onChanged() {
    if (_isNormalizing) {
      return;
    }

    final value = _normalizeControllerValue();

    widget.onChanged?.call(value);

    if (value.length == widget.maxLength) {
      if (_lastCompletedValue != value) {
        _lastCompletedValue = value;
        widget.onCompleted?.call(value);
      }
    } else {
      _lastCompletedValue = null;
    }

    if (mounted) {
      setState(() {});
    }
  }

  String _normalizeControllerValue() {
    final controller = fluentOtpCodeFieldController.textEditingController;
    final normalized = controller.text
        .replaceAll(RegExp(r'[^0-9]'), '')
        .characters
        .take(widget.maxLength)
        .toString();

    if (controller.text != normalized) {
      _isNormalizing = true;
      try {
        controller.value = TextEditingValue(
          text: normalized,
          selection: TextSelection.collapsed(offset: normalized.length),
        );
      } finally {
        _isNormalizing = false;
      }
    }

    return normalized;
  }

  void _requestFocus() {
    if (widget.enabled) {
      fluentOtpCodeFieldController._focus.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = fluentOtpCodeFieldController.textEditingController;
    final value = controller.text;

    return ListenableBuilder(
      listenable: fluentOtpCodeFieldController.hasFocus,
      builder: (context, child) {
        final hasFocus = fluentOtpCodeFieldController.hasFocus.value;
        final activeIndex = value.length >= widget.maxLength
            ? widget.maxLength - 1
            : value.length;

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _requestFocus,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0,
                  child: TextField(
                    key: const ValueKey('fluent_otp_code_field_input'),
                    controller: controller,
                    focusNode: fluentOtpCodeFieldController._focus,
                    autofocus: widget.autofocus,
                    enabled: widget.enabled,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    maxLength: widget.maxLength,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(widget.maxLength),
                    ],
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    style: const TextStyle(color: Colors.transparent),
                    cursorColor: Colors.transparent,
                    onTapOutside: (_) {
                      fluentOtpCodeFieldController._focus.unfocus();
                    },
                  ),
                ),
              ),
              _FluentOtpCodeFieldScope(
                value: value,
                maxLength: widget.maxLength,
                activeIndex: activeIndex,
                hasFocus: hasFocus,
                hasError: widget.hasError,
                enabled: widget.enabled,
                obscureText: widget.obscureText,
                child: widget.child,
              ),
            ],
          ),
        );
      },
    );
  }
}

class FluentOtpCodeGroup extends StatelessWidget {
  final List<Widget> children;
  final bool isFullWidth;

  const FluentOtpCodeGroup({
    super.key,
    required this.children,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: Row(
        mainAxisAlignment: isFullWidth
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        children: [
          for (var index = 0; index < children.length; index++)
            Padding(
              padding: EdgeInsets.only(
                right: isFullWidth || index == children.length - 1
                    ? 0
                    : FluentSize.size80.value,
              ),
              child: children[index],
            ),
        ],
      ),
    );
  }
}

class FluentOtpCodeSlot extends StatelessWidget {
  final int index;

  const FluentOtpCodeSlot({super.key, required this.index})
    : assert(index >= 0);

  @override
  Widget build(BuildContext context) {
    final scope = _FluentOtpCodeFieldScope.of(context);
    final isFilled = index < scope.value.length;
    final isActive =
        scope.hasFocus && scope.enabled && index == scope.activeIndex;

    return _OtpCodeCell(
      key: ValueKey('fluent_otp_code_slot_$index'),
      character: isFilled
          ? scope.obscureText
                ? '•'
                : scope.value[index]
          : '',
      enabled: scope.enabled,
      hasError: scope.hasError,
      isActive: isActive,
      isFilled: isFilled,
    );
  }
}

class FluentOtpCodeSeparator extends StatelessWidget {
  const FluentOtpCodeSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final fluentTheme = FluentThemeDataModel.of(context) as Fluent2ThemeData;

    return SizedBox(
      width: FluentSize.size160.value,
      height: FluentSize.size520.value,
      child: Center(
        child: FluentText(
          '-',
          style: fluentTheme.fluentTextTheme?.title3?.fluentCopyWith(
            fluentColor: colorMode(
              FluentColors.neutralForeground2Rest,
              FluentDarkColors.neutralForeground2Rest,
            ),
          ),
        ),
      ),
    );
  }
}

class _OtpCodeCell extends StatelessWidget {
  final String character;
  final bool enabled;
  final bool hasError;
  final bool isActive;
  final bool isFilled;

  const _OtpCodeCell({
    super.key,
    required this.character,
    required this.enabled,
    required this.hasError,
    required this.isActive,
    required this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final fluentTheme = FluentThemeDataModel.of(context) as Fluent2ThemeData;

    final foregroundColor = enabled
        ? colorMode(
            FluentColors.neutralForeground1Rest,
            FluentDarkColors.neutralForeground1Rest,
          )
        : colorMode(
            FluentColors.neutralForegroundDisabled1Rest,
            FluentDarkColors.neutralForegroundDisabled1Rest,
          );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      width: FluentSize.size400.value,
      height: FluentSize.size520.value,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _backgroundColor(colorMode),
        borderRadius: BorderRadius.circular(FluentCornerRadius.large.value),
        border: Border.all(
          color: _strokeColor(context, colorMode),
          width: isActive
              ? FluentStrokeThickness.strokeWidth20.value
              : FluentStrokeThickness.strokeWidth10.value,
        ),
      ),
      child: FluentText(
        character,
        textAlign: TextAlign.center,
        style: fluentTheme.fluentTextTheme?.title3?.fluentCopyWith(
          fluentColor: foregroundColor,
        ),
      ),
    );
  }

  Color _backgroundColor(Color Function(Color, Color) colorMode) {
    if (!enabled) {
      return colorMode(
        FluentColors.neutralBackgroundDisabledRest,
        FluentDarkColors.neutralBackgroundDisabledRest,
      );
    }

    if (hasError) {
      return colorMode(
        FluentColors.statusDangerBackground1Rest,
        FluentDarkColors.statusDangerBackground1Rest,
      );
    }

    return colorMode(
      isFilled
          ? FluentColors.neutralBackground2Rest
          : FluentColors.neutralBackground4Rest,
      isFilled
          ? FluentDarkColors.neutralBackground2Rest
          : FluentDarkColors.neutralBackground4Rest,
    );
  }

  Color _strokeColor(
    BuildContext context,
    Color Function(Color, Color) colorMode,
  ) {
    if (!enabled) {
      return colorMode(
        FluentColors.neutralStrokeDisabledRest,
        FluentDarkColors.neutralStrokeDisabledRest,
      );
    }

    if (hasError) {
      return colorMode(
        FluentColors.statusDangerStroke1Rest,
        FluentDarkColors.statusDangerStroke1Rest,
      );
    }

    if (isActive) {
      return FluentColors.of(context)?.brandStroke1Rest ??
          Theme.of(context).colorScheme.primary;
    }

    return colorMode(
      FluentColors.neutralStroke1Rest,
      FluentDarkColors.neutralStroke1Rest,
    );
  }
}

class FluentOtpCodeFieldController {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode _focus = FocusNode();
  final ValueNotifier<bool> hasFocus = ValueNotifier(false);

  FluentOtpCodeFieldController() {
    _focus.addListener(() {
      hasFocus.value = _focus.hasFocus;
    });
  }

  String get text => textEditingController.text;

  void clear() {
    textEditingController.clear();
  }

  void dispose() {
    textEditingController.dispose();
    _focus.dispose();
    hasFocus.dispose();
  }
}

class _FluentOtpCodeFieldScope extends InheritedWidget {
  final String value;
  final int maxLength;
  final int activeIndex;
  final bool hasFocus;
  final bool hasError;
  final bool enabled;
  final bool obscureText;

  const _FluentOtpCodeFieldScope({
    required this.value,
    required this.maxLength,
    required this.activeIndex,
    required this.hasFocus,
    required this.hasError,
    required this.enabled,
    required this.obscureText,
    required super.child,
  });

  static _FluentOtpCodeFieldScope of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<_FluentOtpCodeFieldScope>();

    assert(
      scope != null,
      'FluentOtpCodeSlot must be used inside a FluentOtpCodeField.',
    );

    return scope!;
  }

  @override
  bool updateShouldNotify(_FluentOtpCodeFieldScope oldWidget) {
    return value != oldWidget.value ||
        maxLength != oldWidget.maxLength ||
        activeIndex != oldWidget.activeIndex ||
        hasFocus != oldWidget.hasFocus ||
        hasError != oldWidget.hasError ||
        enabled != oldWidget.enabled ||
        obscureText != oldWidget.obscureText;
  }
}

class _InternalFluentOtpCodeFieldController
    extends FluentOtpCodeFieldController {}
