import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent_icons.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentTextFieldView extends StatefulWidget {
  const FluentTextFieldView({super.key});

  @override
  State<FluentTextFieldView> createState() => _FluentTextFieldViewState();
}

class _FluentTextFieldViewState extends State<FluentTextFieldView> {
  late final FluentTextFieldController filledController;
  late final FluentTextFieldController typingController;
  late final FluentTextFieldController errorController;

  @override
  void initState() {
    super.initState();
    filledController = FluentTextFieldController()
      ..textEditingController.text = "Input text";
    typingController = FluentTextFieldController()
      ..textEditingController.text = "Input text";
    errorController = FluentTextFieldController()
      ..textEditingController.text = "Input text";
  }

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Text Field",
          subtitle: "Components > Fluent Text Field",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FluentSectionDescription(
              description:
                  "Assistive texts, icons and suffixes are optional and hidden by default in the text fields components.",
            ),
            FluentContainer(
              padding: EdgeInsets.symmetric(
                vertical: FluentSize.size240.value,
                horizontal: FluentSize.size160.value,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StateLabel("Filled"),
                  FluentTextField(
                    label: "Label",
                    controller: filledController,
                    assistiveText: "Assistive text",
                    prefixIcon: Icon(FluentIcons.search_24_regular),
                  ),
                  SizedBox(height: FluentSize.size240.value),
                  _StateLabel("Placeholder"),
                  FluentTextField(
                    label: "Label",
                    hintText: "Hint text",
                    assistiveText: "Assistive text",
                    prefixIcon: Icon(FluentIcons.search_24_regular),
                  ),
                  SizedBox(height: FluentSize.size240.value),
                  _StateLabel("Focused"),
                  FluentTextField(
                    label: "Label",
                    hintText: "Hint text",
                    assistiveText: "Assistive text",
                    prefixIcon: Icon(FluentIcons.search_24_regular),
                    autofocus: true,
                  ),
                  SizedBox(height: FluentSize.size240.value),
                  _StateLabel("Typing"),
                  FluentTextField(
                    label: "Label",
                    controller: typingController,
                    assistiveText: "Assistive text",
                    prefixIcon: Icon(FluentIcons.search_24_regular),
                  ),
                  SizedBox(height: FluentSize.size240.value),
                  _StateLabel("Error"),
                  FluentTextField(
                    label: "Label",
                    controller: errorController,
                    hasError: true,
                    assistiveText:
                        "Password must contain 8 characters and include letters, numbers and symbols",
                    prefixIcon: Icon(FluentIcons.search_24_regular),
                  ),
                  SizedBox(height: FluentSize.size240.value),
                  _StateLabel("Disabled"),
                  FluentTextField(
                    label: "Label",
                    hintText: "Hint text",
                    assistiveText: "Assistive text",
                    prefixIcon: Icon(FluentIcons.lock_closed_24_regular),
                    enabled: false,
                  ),
                  SizedBox(height: FluentSize.size480.value),
                  FluentButton(
                    title: "Continue",
                    variant: FluentButtonVariant.outline,
                    isFullWidget: true,
                    onPressed: null,
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

class _StateLabel extends StatelessWidget {
  final String text;
  const _StateLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: FluentSize.size40.value),
      child: FluentText(
        text,
        style: FluentThemeDataModel.of(context)
            .fluentTextTheme
            ?.caption2
            ?.fluentCopyWith(
              fluentColor: createColorMode(Theme.of(context).brightness)(
                FluentColors.neutralForeground2Rest,
                FluentDarkColors.neutralForeground2Rest,
              ),
            ),
      ),
    );
  }
}
