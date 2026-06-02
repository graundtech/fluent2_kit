import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentOtpCodeFieldView extends StatefulWidget {
  const FluentOtpCodeFieldView({super.key});

  @override
  State<FluentOtpCodeFieldView> createState() => _FluentOtpCodeFieldViewState();
}

class _FluentOtpCodeFieldViewState extends State<FluentOtpCodeFieldView> {
  late final FluentOtpCodeFieldController separatorController;
  late final FluentOtpCodeFieldController disabledController;
  late final FluentOtpCodeFieldController invalidController;
  late final FluentOtpCodeFieldController fourDigitsController;
  late final FluentOtpCodeFieldController formController;
  late final FluentOtpCodeFieldController controlledController;

  @override
  void initState() {
    super.initState();
    separatorController = FluentOtpCodeFieldController();
    disabledController = FluentOtpCodeFieldController()
      ..textEditingController.text = "123456";
    invalidController = FluentOtpCodeFieldController()
      ..textEditingController.text = "000000";
    fourDigitsController = FluentOtpCodeFieldController();
    formController = FluentOtpCodeFieldController();
    controlledController = FluentOtpCodeFieldController()
      ..textEditingController.text = "22223";
  }

  @override
  void dispose() {
    separatorController.dispose();
    disabledController.dispose();
    invalidController.dispose();
    fourDigitsController.dispose();
    formController.dispose();
    controlledController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent OTP Code Field",
          subtitle: "Components > Fluent OTP Code Field",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FluentSectionDescription(
              description:
                  "Composable one-time password inputs for verification flows.",
            ),
            FluentContainer(
              padding: EdgeInsets.symmetric(
                vertical: FluentSize.size240.value,
                horizontal: FluentSize.size160.value,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ExampleSection(
                    title: "Separator",
                    description:
                        "Use FluentOtpCodeSeparator to split slots into readable groups.",
                    child: FluentOtpCodeField(
                      controller: separatorController,
                      child: const _SixDigitOtp(),
                    ),
                  ),
                  _ExampleSection(
                    title: "Disabled",
                    description:
                        "Disable the input while keeping its code visible.",
                    child: FluentOtpCodeField(
                      controller: disabledController,
                      enabled: false,
                      child: const _SixDigitOtp(),
                    ),
                  ),
                  _ExampleSection(
                    title: "Invalid",
                    description: "Use hasError to show an invalid code state.",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FluentOtpCodeField(
                          controller: invalidController,
                          hasError: true,
                          child: const _SixDigitOtp(),
                        ),
                        SizedBox(height: FluentSize.size80.value),
                        _SupportText(
                          "The code has expired. Request a new one.",
                          hasError: true,
                        ),
                      ],
                    ),
                  ),
                  _ExampleSection(
                    title: "Four Digits",
                    description:
                        "A compact PIN-style variation using maxLength: 4.",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FluentOtpCodeField(
                          controller: fourDigitsController,
                          maxLength: 4,
                          onChanged: (_) {
                            setState(() {});
                          },
                          child: const _FourDigitOtp(),
                        ),
                        SizedBox(height: FluentSize.size160.value),
                        FluentButton(
                          title: "Continue",
                          variant: FluentButtonVariant.outline,
                          isFullWidget: true,
                          onPressed: fourDigitsController.text.length == 4
                              ? () {}
                              : null,
                        ),
                      ],
                    ),
                  ),
                  _ExampleSection(
                    title: "Form",
                    description:
                        "Compose the OTP with labels, actions and submission controls.",
                    child: _VerificationForm(
                      controller: formController,
                      onChanged: () {
                        setState(() {});
                      },
                    ),
                  ),
                  _ExampleSection(
                    title: "Controlled",
                    description:
                        "Listen to onChanged to reflect the current value.",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FluentOtpCodeField(
                          controller: controlledController,
                          onChanged: (_) {
                            setState(() {});
                          },
                          child: const _SixDigitOtp(),
                        ),
                        SizedBox(height: FluentSize.size120.value),
                        Center(
                          child: FluentText(
                            "You entered: ${controlledController.text}",
                            style: FluentThemeDataModel.of(context)
                                .fluentTextTheme
                                ?.caption1
                                ?.fluentCopyWith(
                                  fluentColor: createColorMode(
                                    Theme.of(context).brightness,
                                  )(
                                    FluentColors.neutralForeground1Rest,
                                    FluentDarkColors.neutralForeground1Rest,
                                  ),
                                ),
                          ),
                        ),
                      ],
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

class _ExampleSection extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const _ExampleSection({
    required this.title,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: FluentSize.size480.value),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluentText(
            title,
            style: FluentThemeDataModel.of(context)
                .fluentTextTheme
                ?.body1Strong
                ?.fluentCopyWith(
                  fluentColor: createColorMode(Theme.of(context).brightness)(
                    FluentColors.neutralForeground1Rest,
                    FluentDarkColors.neutralForeground1Rest,
                  ),
                ),
          ),
          SizedBox(height: FluentSize.size80.value),
          _SupportText(description),
          SizedBox(height: FluentSize.size160.value),
          child,
        ],
      ),
    );
  }
}

class _VerificationForm extends StatelessWidget {
  final FluentOtpCodeFieldController controller;
  final void Function() onChanged;

  const _VerificationForm({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FluentContainer(
      width: double.infinity,
      padding: EdgeInsets.all(FluentSize.size160.value),
      cornerRadius: FluentCornerRadius.large,
      strokeStyle: FluentStrokeStyle(
        thickness: FluentStrokeThickness.strokeWidth10,
        color: createColorMode(Theme.of(context).brightness)(
          FluentColors.neutralStroke2Rest,
          FluentDarkColors.neutralStroke2Rest,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluentText(
            "Verify your login",
            style: FluentThemeDataModel.of(context)
                .fluentTextTheme
                ?.body1Strong
                ?.fluentCopyWith(
                  fluentColor: createColorMode(Theme.of(context).brightness)(
                    FluentColors.neutralForeground1Rest,
                    FluentDarkColors.neutralForeground1Rest,
                  ),
                ),
          ),
          SizedBox(height: FluentSize.size80.value),
          _SupportText(
            "Enter the verification code we sent to m@example.com.",
          ),
          SizedBox(height: FluentSize.size240.value),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _FieldLabel("Verification code")),
              FluentButton(
                title: "Resend Code",
                variant: FluentButtonVariant.outline,
                size: FluentButtonSize.small,
                onPressed: () {
                  controller.clear();
                  onChanged();
                },
              ),
            ],
          ),
          SizedBox(height: FluentSize.size80.value),
          FluentOtpCodeField(
            controller: controller,
            onChanged: (_) {
              onChanged();
            },
            child: const _SixDigitOtp(),
          ),
          SizedBox(height: FluentSize.size120.value),
          _SupportText("I no longer have access to this email address."),
          SizedBox(height: FluentSize.size240.value),
          FluentButton(
            title: "Verify",
            variant: FluentButtonVariant.accent,
            isFullWidget: true,
            onPressed: controller.text.length == FluentOtpCodeField.codeLength
                ? () {
                    Navigator.of(context).pop();
                  }
                : null,
          ),
          SizedBox(height: FluentSize.size120.value),
          _SupportText("Having trouble signing in? Contact support."),
        ],
      ),
    );
  }
}

class _SixDigitOtp extends StatelessWidget {
  const _SixDigitOtp();

  @override
  Widget build(BuildContext context) {
    return FluentOtpCodeGroup(
      children: const [
        FluentOtpCodeSlot(index: 0),
        FluentOtpCodeSlot(index: 1),
        FluentOtpCodeSlot(index: 2),
        FluentOtpCodeSeparator(),
        FluentOtpCodeSlot(index: 3),
        FluentOtpCodeSlot(index: 4),
        FluentOtpCodeSlot(index: 5),
      ],
    );
  }
}

class _FourDigitOtp extends StatelessWidget {
  const _FourDigitOtp();

  @override
  Widget build(BuildContext context) {
    return FluentOtpCodeGroup(
      children: const [
        FluentOtpCodeSlot(index: 0),
        FluentOtpCodeSlot(index: 1),
        FluentOtpCodeSlot(index: 2),
        FluentOtpCodeSlot(index: 3),
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;

  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return FluentText(
      text,
      style: FluentThemeDataModel.of(context)
          .fluentTextTheme
          ?.caption1Strong
          ?.fluentCopyWith(
            fluentColor: createColorMode(Theme.of(context).brightness)(
              FluentColors.neutralForeground1Rest,
              FluentDarkColors.neutralForeground1Rest,
            ),
          ),
    );
  }
}

class _SupportText extends StatelessWidget {
  final String text;
  final bool hasError;

  const _SupportText(
    this.text, {
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);

    return FluentText(
      text,
      style: FluentThemeDataModel.of(context)
          .fluentTextTheme
          ?.caption1
          ?.fluentCopyWith(
            fluentColor: hasError
                ? colorMode(
                    FluentColors.statusDangerForeground2Rest,
                    FluentDarkColors.statusDangerForeground2Rest,
                  )
                : colorMode(
                    FluentColors.neutralForeground2Rest,
                    FluentDarkColors.neutralForeground2Rest,
                  ),
          ),
    );
  }
}
